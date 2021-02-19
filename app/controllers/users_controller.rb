class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :update, :show, :destroy]
    def home
        if signed_in?
            @user = current_user
        end
    end
    
    
    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new()
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "User successfully created"
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          render :new
        end
    end

    def edit
    end
    
    def update
        if @user.update(user_params)
          flash[:success] = "User was successfully updated"
          redirect_to @user
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            flash[:success] = 'User was successfully deleted.'
            redirect_to users_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to users_url
        end
    end
    
    def find_user
        @user = User.find(params[:id])        
    end
    
    
    private

    def user_params
        params.require(:user).permit(:name,:email,:password,:age)
    end
    
    
end
