class TagsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    if params[:query].present? && params[:secondquery].present?
      @tags_species1 = Tag.global_search(params[:query]).to_a
      @tags_species2 = Tag.global_search(params[:secondquery]).to_a

      @tags = [@tags_species1, @tags_species2].flatten

    elsif params[:query].present?
      @tags = Tag.global_search(params[:query])
    else
      @tags = Tag.all
    end

    @markers = @tags.map do |tag|
      {
        lat: tag.latitude,
        lng: tag.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { tag: tag })
        # infoWindow: render_to_string(partial: "info_window", locals: { tag: tag })
        # image_url: helpers.asset_url('../assets/images/mask.png')
      }
    end
  end
end
