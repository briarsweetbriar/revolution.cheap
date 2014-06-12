require 'spec_helper'

describe ProjectsController do

  describe "GET index" do
    it "assigns all projects as @projects" do
      project_1 = FactoryGirl.create :project, title: "Project 1"
      project_2 = FactoryGirl.create :project, title: "Project 2"
      project_3 = FactoryGirl.create :project, title: "Project 3"
      get :index
      assigns(:projects).should eq([project_1, project_2, project_3])
    end
  end

  describe "GET show" do
    it "assigns the requested project as @project" do
      project = FactoryGirl.create :project
      get :show, id: project
      expect(assigns(:project)).to eq project
    end
  end

  describe "POST create" do
    describe "when signed in" do
      login_user
      describe "with valid params" do
        it "creates a new Project" do
          expect {
            post :create, project: FactoryGirl.attributes_for(:project)
          }.to change(Project, :count).by(1)
        end

        it "assigns a newly created project as @project" do
          post :create, project: FactoryGirl.attributes_for(:project)
          expect(assigns(:project)).to be_a(Project)
          expect(assigns(:project)).to be_persisted
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved project as @project" do
          # Trigger the behavior that occurs when invalid params are submitted
          Project.any_instance.stub(:save).and_return(false)
          post :create, project: FactoryGirl.attributes_for(:invalid_project)
          expect(assigns(:project)).to be_a_new(Project)
        end
      end
    end

    describe "when not signed in" do
      it "fails to create a new Project" do
        expect {
          post :create, project: FactoryGirl.attributes_for(:project)
        }.to change(Project, :count).by(0)
      end
    end
  end

  describe "PATCH update" do
    login_user
    before :each do
      @project = FactoryGirl.create :project, title: "Old Title", user: @logged_in_user
    end

    describe "when signed in" do
      describe "with valid params" do
        it "locates the requested project" do
          patch :update, id: @project,
            project: FactoryGirl.attributes_for(:project)
          expect(assigns(:project)).to eq(@project)
        end

        it "updates the requested project" do
          patch :update, id: @project,
            project: FactoryGirl.attributes_for(:project, title: "New Title")
          @project.reload
          expect(@project.title).to eq("New Title")
        end
      end

      describe "with invalid params" do
        it "does not change the project's attributes" do
          patch :update, id: @project,
            project: FactoryGirl.attributes_for(:invalid_project)
          @project.reload
          expect(@project.title).to eq("Old Title")
        end
      end
    end

    describe "when not signed in" do
      logout_user

      it "updates the requested project" do
        patch :update, id: @project,
          project: FactoryGirl.attributes_for(:project, title: "New Title")
        @project.reload
        expect(@project.title).to eq("Old Title")
      end
    end
  end

  describe "DELETE destroy" do
    login_user

    before :each do
      @project = FactoryGirl.create :project, user: @logged_in_user
    end

    describe "when signed in" do
      it "deletes the project" do
        expect{
          delete :destroy, id: @project
        }.to change(Project, :count).by(-1)
      end
    end

    describe "when not signed in" do
      logout_user

      it "deletes the project" do
        expect{
          delete :destroy, id: @project
        }.to change(Project, :count).by(0)
      end
    end
  end

end
