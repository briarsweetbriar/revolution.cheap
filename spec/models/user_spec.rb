require 'spec_helper'

describe User do

  context "associates through" do
    before :each do
      @user = FactoryGirl.build(:user)
    end

    it "has_many posts" do
      expect(@user).to have_many(:posts)
    end

    it "has_many project_roles" do
      expect(@user).to have_many(:project_roles)
    end

    it "has_many projects" do
      expect(@user).to have_many(:projects)
    end

    it "has_one user_avatar" do
      expect(@user).to have_one(:user_avatar)
    end
  end

  context "validates" do
    before :each do
      @user = FactoryGirl.build(:user)
    end

    it "the presence of a bio" do
      expect(@user).to validate_presence_of(:bio)
    end

    it "that the slug is unique" do
      expect(@user).to validate_uniqueness_of(:slug).case_insensitive
    end

    it "the presence of a username" do
      expect(@user).to validate_presence_of(:username)
    end

    it "that the username is between 3 and 30 characters" do
      expect(@user).to ensure_length_of(:username).is_at_least(3).is_at_most(30)
    end

    it "that the username is unique" do
      expect(@user).to validate_uniqueness_of(:username).case_insensitive
    end
  end

  it "associates with a UserAvatar if a user_avatar_id is provided" do
    user_avatar = FactoryGirl.create(:user_avatar)
    user = FactoryGirl.create(:user, user_avatar_id: user_avatar.id)
    expect(user.user_avatar).to eq user_avatar
  end

  context "counts" do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    it "posts" do
      post_1 = FactoryGirl.create(:post, user: @user)
      post_2 = FactoryGirl.create(:post, user: @user)
      project_1 = FactoryGirl.create(:project)
      FactoryGirl.create(:project_role, user: @user, project: project_1)
      @user.reload
      expect(@user.posts_count).to eq 2
    end

    it "projects" do
      project_1 = FactoryGirl.create(:project)
      project_2 = FactoryGirl.create(:project)
      FactoryGirl.create(:project_role, user: @user, project: project_1)
      FactoryGirl.create(:project_role, user: @user, project: project_2)
      post_1 = FactoryGirl.create(:post, user: @user)
      @user.reload
      expect(@user.projects_count).to eq 2
    end
  end
end
