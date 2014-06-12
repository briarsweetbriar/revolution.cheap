class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include ActionController::MimeResponds
  include AbstractController::Translation
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :authenticate_user_from_token!

  def render_validation_errors errors
    render json: { errors: errors.to_hash }, status: 422
  end

  rescue_from CanCan::AccessDenied do |exception|
    message = message_for_can_can_exception(exception)
    render json: { errors: { base: message } }, status: :unprocessable_entity
  end
 
  private
  def authenticate_user_from_token!
    authenticate_with_http_token do |token, options|
      user_email = options[:user_email].presence
      user       = user_email && User.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, token)
        sign_in user, store: false
      end
    end
  end

  def message_for_can_can_exception(exception)
    if user_signed_in?
      "You lack permission to perform this action."
    else
      "You must sign in to perform this action."
    end
  end

end
