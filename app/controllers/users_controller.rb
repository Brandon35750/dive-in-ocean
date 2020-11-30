class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @tags = @user.tags
    @markers = @tags.map do |tag| {
        lat: tag.latitude,
        lng: tag.longitude,
        #infoWindow: render_to_string(partial: "info_window", locals: { tag: tag })
        # infoWindow: render_to_string(partial: "info_window", locals: { tag: tag })
        # image_url: helpers.asset_url('../assets/images/mask.png')
    }
  end
  end
end
