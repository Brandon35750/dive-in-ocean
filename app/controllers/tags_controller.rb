class TagsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @tag = Tag.find(params[:id])
  end


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
