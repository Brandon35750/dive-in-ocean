class TagsController < ApplicationController

  def index
    @tags = Tag.all
    @markers = @tags.geocoded.map do |tag|
        {
          lat: tag.latitude,
          lng: tag.longitude
          # infoWindow:
        }
    end
  end

end
