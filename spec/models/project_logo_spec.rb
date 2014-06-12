require 'spec_helper'

describe ProjectLogo do

  context "associates through" do
    before :each do
      @project_logo = FactoryGirl.build(:project_logo)
    end

    it "belongs_to project" do
      expect(@project_logo).to belong_to(:project)
    end
  end
end
