class Admin::UsersController < Admin::ApplicationController
    before_action :set_user, except: [:index]
 
 
    def index
        @users = User.all 
    end 

    def show 
    end 

    def edit
    end

    def update         
        if @user.update(user_params)
          redirect_to admin_user_path(@user)
        else
          render :edit
        end
    end

    def destroy 
        @user.destroy
        redirect_to admin_users_path
    end 

    private 
     
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        #params.require(:user).permit(:username, :email, :password)
        params.require(:user).permit(:username, :email)
    end 

end
