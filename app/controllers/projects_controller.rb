class ProjectsController < ApplicationController
  # GET /projects.json
  def index
    @projects = QueryParams.new(Project, params).build

    render json: @projects, each_serializer: ProjectSerializer
  end

  # GET /projects/1.json
  def show
    @project = Project.friendly.find(params[:id])

    render json: @project, serializer: ProjectSerializer
  end

  # POST /projects.json
  def create
    authorize! :create, Project.new

    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created
    else
      render_validation_errors @project.errors
    end
  end

  # PATCH/PUT /projects/1.json
  def update
    @project = Project.friendly.find(params[:id])

    authorize! :update, @project

    if @project.update(project_params)
      head :no_content
    else
      render_validation_errors @project.errors
    end
  end

  # DELETE /projects/1.json
  def destroy
    @project = Project.friendly.find(params[:id])

    authorize! :update, @project
    @project.destroy

    head :no_content
  end

  private
  def project_params
    params["project"]["project_roles_attributes"] = params["project"].delete "project_roles"
    params.require(:project).permit(:title, :description, :website, :source,
      project_roles_attributes: [:_destroy, :id, :title, :name, :website, :user_id],
      taggings_attributes: [:tag_id]
    )
  end
end