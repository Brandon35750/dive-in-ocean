class TagsController < ApplicationController

  def index
    if params[:query].present?
        @tags = Tag.global_search(params[:query])
    else
        @tags = Tag.all
    end

    @markers = @tags.geocoded.map do |tag|
        {
          lat: tag.latitude,
          lng: tag.longitude
          # infoWindow:
        }
    end
  end

end

