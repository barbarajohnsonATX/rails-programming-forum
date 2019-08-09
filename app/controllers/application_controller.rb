class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :check_for_logged_in?, :admin_only, :display_datetime

    #private 
    def current_user
        #save value into instance variable, only hit the DB once if instance variable exists
        @current_user ||= User.find_by_id(session[:user_id])
    end
  
    def logged_in?
        # !! returns everything into boolean
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

    def display_datetime(dt)
        dt.strftime("%m/%d/%Y 1:%M%P %Z")
    end

end
