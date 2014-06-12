require 'spec_helper'

describe ProjectRolesController do

  describe "GET index" do
    it "assigns all project_roles as @project_roles" do
      project_role_1 = FactoryGirl.create :project_role
      project_role_2 = FactoryGirl.create :project_role
      project_role_3 = FactoryGirl.create :project_role
      get :index
      assigns(:project_roles).should eq([project_role_1, project_role_2, project_role_3])
    end
  end

  describe "GET show" do
    it "assigns the requested project_role as @project_role" do
      project_role = FactoryGirl.create :project_role
      get :show, id: project_role
      expect(assigns(:project_role)).to eq project_role
    end
  end

end
