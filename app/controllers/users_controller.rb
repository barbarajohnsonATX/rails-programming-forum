class UsersController < ApplicationController
    before_action :check_for_logged_in, only: [:show]
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
         @my_questions = current_user.questions

        #answer belongs to user 
         @my_answers = current_user.answers

        @my_questions_open = @my_questions.unanswered 

        #unique categories in which questions belong 
        @categories = current_user.categories.uniq

     end 

    private 
     

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

end
