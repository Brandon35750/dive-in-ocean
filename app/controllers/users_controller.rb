class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @tags = @user.tags
    @markers = @tags.map do |tag|
      {
        lat: tag.latitude,
        lng: tag.longitude,
        infoWindow: render_to_string(partial: "tags/info_window", locals: { tag: tag })
        # infoWindow: render_to_string(partial: "info_window", locals: { tag: tag })
        # image_url: helpers.asset_url('../assets/images/mask.png')
      }
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :diving_level, :description, :avatar)
  end
end
