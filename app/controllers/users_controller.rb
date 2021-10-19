class UsersController < ApplicationController

    def index
        authorize! :index, User
        @users = User.accessible_by(current_ability)
        render json: UserSerializer.new(@users)
    end

    def show
        if current_user.teacher?
            render json: TeacherProfileSerializer.new(current_user.teacher_profile), status: :ok
        else
            render json: UserSerializer.new(current_user), status: :ok
        end
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
        params.permit(:email, :password)
    end
end
