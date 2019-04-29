class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end
    def create
      
        # user = User.new(params.require(:user).permit(:name, :email))
        
        
        # user.save!
        # render json: user
        debugger
        user = User.new(user_params)
        debugger
        if user.save
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: params[:id]
    end

    private
    def user_params
        params.require(:user).permit(:name,:email)
    end

end