class SearchController < ApplicationController
  
    def index
        @search_tag = params[:name]
        @tag = Tag.search_by_tag(params[:name]).first
 
    end 
end
