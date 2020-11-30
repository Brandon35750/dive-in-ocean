class User::TagsController < ApplicationController
    def create
        @tag = Tag.new(tag_params)
        if @tag.save
            redirect_to tag_path(@tag)
        else
            render 'new'
        end
    end


    def new
        @tag = Tag.new
    end
end
