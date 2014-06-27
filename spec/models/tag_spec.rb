require 'spec_helper'

describe Tag do

  context "associates through" do
    before :each do
      @tag = FactoryGirl.build(:tag)
    end

    it "has_many taggings" do
      expect(@tag).to have_many(:taggings)
    end

    it "has_many posts" do
      expect(@tag).to have_many(:posts).through(:taggings)
    end

    it "has_many projects" do
      expect(@tag).to have_many(:projects).through(:taggings)
    end
  end

  context "validates" do
    before :each do
      @tag = FactoryGirl.build(:tag)
    end

    it "the presence of a name" do
      expect(@tag).to validate_presence_of(:name)
    end

    it "that the name is between 3 and 30 characters" do
      expect(@tag).to ensure_length_of(:name).is_at_least(3).is_at_most(30)
    end
  end

  context "counts" do
    before :each do
      @tag = FactoryGirl.create(:tag, name: "tag1")
    end

    it "posts" do
      post_1 = FactoryGirl.create(:post, tag_names: "tag1")
      post_2 = FactoryGirl.create(:post, tag_names: "tag1")
      project_1 = FactoryGirl.create(:project, tag_names: "tag1")
      @tag.reload
      expect(@tag.posts_count).to eq 2
    end

    it "projects" do
      project_1 = FactoryGirl.create(:project, tag_names: "tag1")
      project_2 = FactoryGirl.create(:project, tag_names: "tag1")
      post_1 = FactoryGirl.create(:post, tag_names: "tag1")
      @tag.reload
      expect(@tag.projects_count).to eq 2
    end
  end
end
