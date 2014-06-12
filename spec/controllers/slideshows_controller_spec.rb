require 'spec_helper'

describe SlideshowsController do

  describe "GET show" do
    it "assigns the requested slideshow as @slideshow" do
      slideshow = FactoryGirl.create :slideshow
      get :show, id: slideshow
      expect(assigns(:slideshow)).to eq slideshow
    end
  end

end
