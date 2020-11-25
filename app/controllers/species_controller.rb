class SpeciesController < ApplicationController

  def index
    @species = Species.all
  end

  def show
    @species = Species.find(params[:id])
  end

  def species_params
    params.require(:species).permit(:name, :latin_name)
  end
end

