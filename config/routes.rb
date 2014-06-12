Rails.application.routes.draw do
  class FormatTest
    attr_accessor :mime_type

    def initialize(format)
      @mime_type = Mime::Type.lookup_by_extension(format)
    end

    def matches?(request)
      request.format == mime_type
    end
  end

  resources :posts, except: :edit, constraints: FormatTest.new(:json)
  resources :projects, except: :edit, constraints: FormatTest.new(:json)
  resources :project_roles, only: [:index, :show],
    constraints: FormatTest.new(:json)
  resources :project_logos, only: [:show, :create],
    constraints: FormatTest.new(:json)
  resources :slideshows, only: :show, constraints: FormatTest.new(:json)
  resources :slideshow_images, only: [:show, :create],
    constraints: FormatTest.new(:json)
  resources :tags, only: [:show, :index], constraints: FormatTest.new(:json)
  resources :taggings, only: [:show, :index], constraints: FormatTest.new(:json)
  resources :users, only: [:index, :show, :update],
    constraints: FormatTest.new(:json)
  resources :user_avatars, only: [:show, :create],
    constraints: FormatTest.new(:json)
  get '*foo', to: 'ember#index', constraints: FormatTest.new(:html)
  get '/', to: 'ember#index', constraints: FormatTest.new(:html)

  devise_for :users, controllers: { sessions: 'sessions' }
end
