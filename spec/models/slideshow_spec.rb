require 'spec_helper'

describe Slideshow do

  context "associates through" do
    before :each do
      @slideshow = FactoryGirl.build(:slideshow)
    end

    it "belongs_to slideshowable" do
      expect(@slideshow).to belong_to(:slideshowable)
    end

    it "has_many project_images" do
      expect(@slideshow).to have_many(:slideshow_images)
    end
  end

  context "validates" do
    before :each do
      @slideshow = FactoryGirl.build(:slideshow)
    end

    it "the presence of a slideshowable" do
      expect(@slideshow).to validate_presence_of(:slideshowable)
    end

    it "the presence of a title" do
      expect(@slideshow).to validate_presence_of(:title)
    end

    it "that the title is between 3 and 120 characters" do
      expect(@slideshow).to ensure_length_of(:title).is_at_least(3).is_at_most(120)
    end
  end
end
