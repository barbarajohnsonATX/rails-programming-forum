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
            #if @user does not save, it adds errors in @user.errors
            render :new
        end 

    end 

    def show 
         #user has many questions 
         @my_questions = current_user.questions

        #answer belongs to user
        @answered_questions = current_user.answers.collect { |a| a.question}.uniq

        @my_questions_open = @my_questions.unanswered 

        #unique categories in which questions belong 
        @categories = current_user.categories.uniq

        @my_likes = Question.liked_by(current_user)
     end 

    

    private 
     

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

end
