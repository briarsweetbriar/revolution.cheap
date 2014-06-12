require 'spec_helper'

describe ProjectRole do

  context "associates through" do
    before :each do
      @project_role = FactoryGirl.build(:project_role)
    end

    it "belongs_to project" do
      expect(@project_role).to belong_to(:project)
    end

    it "belongs_to user" do
      expect(@project_role).to belong_to(:user)
    end
  end

  context "validates" do
    before :each do
      @project_role = FactoryGirl.build(:project_role)
    end

    it "the presence of a name" do
      expect(@project_role).to validate_presence_of(:name)
    end

    it "that the name is between 3 and 30 characters" do
      expect(@project_role).to ensure_length_of(:name).is_at_least(3).is_at_most(30)
    end

    it "the presence of a title" do
      expect(@project_role).to validate_presence_of(:title)
    end

    it "that the title is between 3 and 30 characters" do
      expect(@project_role).to ensure_length_of(:title).is_at_least(3).is_at_most(30)
    end
  end
end
