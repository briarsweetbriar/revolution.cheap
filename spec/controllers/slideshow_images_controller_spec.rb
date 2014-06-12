require 'spec_helper'

describe SlideshowImagesController do

  describe "GET show" do
    it "assigns the requested slideshow_image as @slideshow_image" do
      slideshow_image = FactoryGirl.create :slideshow_image
      get :show, id: slideshow_image
      expect(assigns(:slideshow_image)).to eq slideshow_image
    end
  end

  describe "POST create" do
    describe "when signed in" do
      login_user
      describe "with valid params" do
        it "creates a new SlideshowImage" do
          expect {
            post :create, slideshow_image: FactoryGirl.attributes_for(:slideshow_image)
          }.to change(SlideshowImage, :count).by(1)
        end

        it "assigns a newly created slideshow_image as @slideshow_image" do
          post :create, slideshow_image: FactoryGirl.attributes_for(:slideshow_image)
          expect(assigns(:slideshow_image)).to be_a(SlideshowImage)
          expect(assigns(:slideshow_image)).to be_persisted
        end
      end
    end

    describe "when not signed in" do
      it "does not save the slideshow_image" do
        expect {
          post :create, slideshow_image: FactoryGirl.attributes_for(:slideshow_image)
        }.to change(SlideshowImage, :count).by(0)
      end
    end
  end

end
