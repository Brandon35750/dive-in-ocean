class TagsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @species = Species.all
    if params[:query].present? && params[:secondquery].present?
      @tags_species1 = Tag.global_search(params[:query]).to_a
      @tags_species1.each { |tag| tag.color_group = 1 }
      @tags_species2 = Tag.global_search(params[:secondquery]).to_a
      @tags_species2.each { |tag| tag.color_group = 2 }
      @tags = [@tags_species1, @tags_species2].flatten
      if @tags_species2.empty?
        flash[:alert] = "This second species is unknown"
        params[:secondquery] = nil
      end

    elsif params[:query].present?
      @tags = Tag.global_search(params[:query])
      @tags_species1 = Tag.global_search(params[:query]).to_a

      if @tags_species1.empty?
        flash[:alert] = "#{params[:query]} is unknown"
        redirect_to(root_path)
      end

    else
      @tags = Tag.all
    end

    @markers = @tags.map do |tag|
        {
          "type": "Feature",
          "geometry": {
            "type": "Point",
            "coordinates": [tag.longitude, tag.latitude]
          },
          "properties": {
            "species": tag.species.name,
            "infoWindow": render_to_string(partial: "info_window", locals: { tag: tag }),
            "color": tag.color_group
          }
        }
      end
   end
end
