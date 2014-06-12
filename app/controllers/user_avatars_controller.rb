class UserAvatarsController < ApplicationController
  # GET /user_avatars/1.json
  def show
    @user_avatar = UserAvatar.find(params[:id])

    render json: @user_avatar
  end

  # POST /user_avatars.json
  def create
    @user_avatar = UserAvatar.new(user_avatar_params)

    authorize! :create, @user_avatar

    if @user_avatar.save
      render json: @user_avatar, status: :created
    else
      render_validation_errors @user_avatar.errors
    end
  end

  private
  def user_avatar_params
    params.require(:user_avatar).permit(:file)
  end
end