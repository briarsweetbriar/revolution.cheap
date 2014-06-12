require 'spec_helper'

describe Tagging do

  context "associates through" do
    before :each do
      @tagging = FactoryGirl.build(:tagging)
    end

    it "belongs_to taggable" do
      expect(@tagging).to belong_to(:taggable)
    end

    it "belongs_to tag" do
      expect(@tagging).to belong_to(:tag)
    end
  end

  context "validates" do
    before :each do
      @tagging = FactoryGirl.build(:tagging)
    end

    it "the tagging is unique" do
      expect(@tagging).to validate_uniqueness_of(:tag).scoped_to(:taggable)
    end
  end
end
