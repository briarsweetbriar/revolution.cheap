class ProjectRolesController < ApplicationController
  # GET /project_roles.json
  def index
    @project_roles = QueryParams.new(ProjectRole, params).build

    render json: @project_roles
  end

  # GET /project_roles/1.json
  def show
    @project_role = ProjectRole.find(params[:id])

    render json: @project_role
  end
end