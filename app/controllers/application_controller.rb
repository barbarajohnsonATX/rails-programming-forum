class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :check_for_logged_in?, :admin_only

    #private 
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
  
    def logged_in?
        !!session[:user_id]
    end


    def check_for_logged_in
        redirect_to root_path if !logged_in?
    end
 
    def admin_only
        if !current_user.admin
          flash[:notice] = "You must be an admin to perform that function!"
          redirect_to questions_path
        end
      end


end
