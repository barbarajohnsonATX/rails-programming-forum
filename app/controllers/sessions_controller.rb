class SessionsController < ApplicationController

    def new 
        #Not needed if using form_for :user 
        #@user = User.new
        render :login
    end 

    def create 
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            if current_user.admin?
                redirect_to admin_root_path
            else 
                redirect_to questions_path 
            end
        else 
            flash[:notice] = "Login failed. Try again."
            redirect_to login_path 
         end 
    end 

    def home 
    end 

    #logout 
    def destroy 
        session.clear 
        flash[:notice] = "Goodbye."
        redirect_to root_path 
    end 

    def omniauth
        @user = User.create_by_google_omniauth(auth)
        session[:user_id] = @user.id 
        redirect_to questions_path
    end 

    def auth 
        request.env['omniauth.auth']
    end 

end