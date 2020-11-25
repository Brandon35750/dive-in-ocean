class TagsController < ApplicationController

    def index
        if params[:query].present?
          @tags = Tag.where(species: params[:query])
        else
          @tags = Tag.all
        end
        @tags = Tag.all
    @markers = @tags.geocoded.map do |tag|
        {
          lat: tag.latitude,
          lng: tag.longitude
          # infoWindow:
        }
    end
    end

    def show
    end


end

