class UsersController < ApplicationController
    before_action :check_for_logged_in
    before_action :set_user, only: [:show]

    #load signup form
    def new 
        @user = User.new
    end 

    #signup
    def create
        @user = User.new(user_params)
        if @user.save 
            #login the user
            session[:user_id] = @user.id
            redirect_to questions_path 
        else 
            render :new
        end 

    end 

    def show 
         #user has many questions 
        @my_questions = current_user.asked_by_me
        #answer belongs to user 
        @my_answers = Answer.answered_by(current_user)
        @my_questions_open = @my_questions.unanswered 

    end 

    private 
     

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

end
