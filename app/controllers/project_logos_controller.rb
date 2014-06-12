class ProjectLogosController < ApplicationController
  # GET /project_logos/1.json
  def show
    @project_logo = ProjectLogo.find(params[:id])

    render json: @project_logo
  end

  # POST /project_logos.json
  def create
    @project_logo = ProjectLogo.new(project_logo_params)

    authorize! :create, @project_logo

    if @project_logo.save
      render json: @project_logo, status: :created
    else
      render_validation_errors @project_logo.errors
    end
  end

  private
  def project_logo_params
    params.require(:project_logo).permit(:file)
  end
end