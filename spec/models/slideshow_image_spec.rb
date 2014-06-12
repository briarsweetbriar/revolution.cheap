require 'spec_helper'

describe SlideshowImage do

  context "associates through" do
    before :each do
      @slideshow_image = FactoryGirl.build(:slideshow_image)
    end

    it "belongs_to slideshow" do
      expect(@slideshow_image).to belong_to(:slideshow)
    end
  end
end
