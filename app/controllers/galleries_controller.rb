class GalleriesController < ApplicationController
  def index
    @species = Species.all
  end
end
