require 'spec_helper'

describe Post do

  context "belongs to" do
    before :each do
      @post = FactoryGirl.build(:post)
    end

    it "a user" do
      expect(@post).to belong_to(:user)
    end
  end

  context "validates" do
    before :each do
      @post = FactoryGirl.build(:post)
    end

    it "the presence of a body" do
      expect(@post).to validate_presence_of(:body)
    end

    it "the presence of a title" do
      expect(@post).to validate_presence_of(:title)
    end

    it "that the title is between 3 and 120 characters" do
      expect(@post).to ensure_length_of(:title).is_at_least(3).is_at_most(120)
    end
  end
end
