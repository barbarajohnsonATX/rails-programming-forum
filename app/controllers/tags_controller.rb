class TagsController < ApplicationController
	def show
		@tag = Tag.find(params[:id])
		@categories = Category.all
    end
    
end
