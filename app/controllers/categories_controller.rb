class CategoriesController < ApplicationController
    #before_action :admin_only, except: [:index, :show]
    #before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :set_category, only: [:show]

    # def new 
    #     @category = Category.new 
    # end 

    # def create 
    #     @category = Category.new(category_params)
    #     if @category.save
    #       redirect_to category_path(@category)
    #     else
    #       render :new
    #     end
    # end 

    def index
        @categories = Category.all
    end
    
    def show
    end

    # def edit
    # end
  
    # def update
    #   @category.update(category_params)
    #   if @category.save
    #     redirect_to category_path(@category)
    #   else
    #     render :edit
    #   end
    # end

    # def destroy 
    #     @category.destroy
    #     redirect_to categories_path
    # end 



    private
    def set_category
        @category = Category.find_by(id: params[:id])
      end
   
      
    # def category_params
    #     params.require(:category).permit(:name)
    # end


end
