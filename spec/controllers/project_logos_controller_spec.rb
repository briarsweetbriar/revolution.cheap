require 'spec_helper'

describe ProjectLogosController do

  describe "GET show" do
    it "assigns the requested project_logo as @project_logo" do
      project_logo = FactoryGirl.create :project_logo
      get :show, id: project_logo
      expect(assigns(:project_logo)).to eq project_logo
    end
  end

  describe "POST create" do
    describe "when signed in" do
      login_user
      describe "with valid params" do
        it "creates a new ProjectLogo" do
          expect {
            post :create, project_logo: FactoryGirl.attributes_for(:project_logo)
          }.to change(ProjectLogo, :count).by(1)
        end

        it "assigns a newly created project_logo as @project_logo" do
          post :create, project_logo: FactoryGirl.attributes_for(:project_logo)
          expect(assigns(:project_logo)).to be_a(ProjectLogo)
          expect(assigns(:project_logo)).to be_persisted
        end
      end
    end

    describe "when not signed in" do
      it "does not save the project_logo" do
        expect {
          post :create, project_logo: FactoryGirl.attributes_for(:project_logo)
        }.to change(ProjectLogo, :count).by(0)
      end
    end
  end

end
