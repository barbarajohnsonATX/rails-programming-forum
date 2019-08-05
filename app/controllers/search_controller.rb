class SearchController < ApplicationController
  
    def index
        @tag = Tag.search_by_tag(params[:name]).first
 
    end 
end
