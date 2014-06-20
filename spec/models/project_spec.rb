require 'spec_helper'

describe Project do

  context "associates through" do
    before :each do
      @project = FactoryGirl.build(:project)
    end

    it "has_many project_roles" do
      expect(@project).to have_many(:project_roles)
    end

    it "has_one project_logo" do
      expect(@project).to have_one(:project_logo)
    end

    it "has_one slideshow" do
      expect(@project).to have_one(:slideshow)
    end
  end

  context "validates" do
    before :each do
      @project = FactoryGirl.build(:project)
    end

    it "the presence of a description" do
      expect(@project).to validate_presence_of(:description)
    end

    it "the presence of a title" do
      expect(@project).to validate_presence_of(:title)
    end

    it "that the title is between 3 and 120 characters" do
      expect(@project).to ensure_length_of(:title).is_at_least(3).is_at_most(120)
    end

    it "that the slug is unique" do
      expect(@project).to validate_uniqueness_of(:slug).case_insensitive
    end
  end

  context "users_include" do
    before :each do
      @project = FactoryGirl.create(:project)
      @user_1 = FactoryGirl.create(:user)
      @user_2 = FactoryGirl.create(:user)
      FactoryGirl.create(:project_role, project: @project, user: @user_1)
    end

    it "returns true if project has user" do
      expect(@project.users_include?(@user_1)).to be true
    end

    it "returns false if project does not have user" do
      expect(@project.users_include?(@user_2)).to be false
    end
  end

end
