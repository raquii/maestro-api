class UsersController < ApplicationController

    def current_ability
        @current_ability ||= UserAbility.new(current_user).merge(StudioAbility.new(current_user))
    end

    def index
        authorize! :index, User
        @users = User.accessible_by(current_ability)
        render json: UserSerializer.new(@users)
    end

    def show
        user = current_user
        render json: UserSerializer.new(user)
    end

    def update
        @user = find_user
        if can? :edit, @user
            @user.update!(user_params)
            render json: UserSerializer.new(@user)
        end
    end

    def destroy
        @user = find_user
        if can? :destroy, @user
            @user.destroy
            render json: {message: "User deleted successfully"}
        end
    end

    private

    def find_user
        User.find(params[:id])
    end

    def user_params
        params.permit(:email, :first_name, :last_name, :phone, :address, :password)
    end
end
