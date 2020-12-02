class User::TagsController < ApplicationController

    def create
        @tag = Tag.new(tag_params)
        @tag.user = current_user
        if @tag.save
            redirect_to user_path(current_user)
        else
            render 'new'
        end
    end

    def new
        @tag = Tag.new
    end

    def index
        @tags = current_user.tags
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        redirect_to user_path(current_user), notice: 'Your tag was successfully destroyed.'
    end

    def tag_params
        params.require(:tag).permit(:diving_date, :latitude, :longitude, :spot_name, :species_id, :depth, :description, :photo)
    end
end
