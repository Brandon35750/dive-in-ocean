class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @species = Species.all
  end
end
