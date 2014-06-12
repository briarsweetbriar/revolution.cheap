class UsersController < ApplicationController
  # GET /users.json
  def index
    @users = QueryParams.new(User, params).build

    render json: @users
  end

  # GET /users/1.json
  def show
    @user = User.friendly.find(params[:id])

    render json: @user
  end

  # PATCH/PUT /users/1.json
  def update
    @user = User.friendly.find(params[:id])

    authorize! :update, @user

    if @user.update(user_params)
      head :no_content
    else
      render_validation_errors @user.errors
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :bio, :image_id)
  end
end