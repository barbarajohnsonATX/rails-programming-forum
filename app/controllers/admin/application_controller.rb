class Admin::ApplicationController < ApplicationController
	before_action :authorize_admin!

  def index
    @questions = Question.all 
    @answers = Answer.all
    @categories = Category.all 
    @users = User.all 

  end



	private

	def authorize_admin!
		if !current_user.admin?
			flash[:alert] = "You do not have permission to perform this action."
			redirect_to questions_path
		end
	end
end
