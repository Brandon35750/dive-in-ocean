class TagsController < ApplicationController
    def index
        if params[:query].present?
          @tags = Tag.where(species: params[:query])
        else
          @tags = Tag.all
        end
    end

    def show
    end
end

