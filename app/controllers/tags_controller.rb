class TagsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @tag = Tag.find(params[:id])
    @user = @tag.user
  end
end
