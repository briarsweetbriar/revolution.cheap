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
end
