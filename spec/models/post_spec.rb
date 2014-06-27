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

  context "manage tags" do
    it "when a single tag is submitted with a new post" do
      post = FactoryGirl.create(:post, tag_names: "tag1")
      tag = Tag.find_by(name: "tag1")
      expect(post.tags).to include(tag)
    end

    it "when multiple tags are submitted with a new post" do
      post = FactoryGirl.create(:post, tag_names: "tag1, tag2")
      tag1 = Tag.find_by(name: "tag1")
      tag2 = Tag.find_by(name: "tag2")
      expect(post.tags).to include(tag1, tag2)
    end

    it "when the tag is preexisting" do
      tag = FactoryGirl.create(:tag, name: "tag1")
      post = FactoryGirl.create(:post, tag_names: "tag1")
      expect(post.tags).to include(tag)
    end

    it "when the post is updated" do
      post = FactoryGirl.create(:post)
      post.update_attributes(tag_names: "tag1")
      tag = Tag.find_by(name: "tag1")
      expect(post.tags).to include(tag)
    end

    it "when the post loses a tag" do
      post = FactoryGirl.create(:post, tag_names: "tag1, tag2")
      post.update_attributes(tag_names: "tag2")
      tag1 = Tag.find_by(name: "tag1")
      expect(post.tags).to_not include(tag1)
    end
  end
end
