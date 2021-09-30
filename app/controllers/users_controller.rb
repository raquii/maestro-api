class UsersController < ApplicationController
    load_and_authorize_resource
    skip_authorization_check :only => :index
    skip_before_action :authenticate_user!, only: :index

    def current_ability
        @current_ability ||= UserAbility.new(current_user).merge(StudioAbility.new(current_user))
    end

    def index
        users = User.all
        render json: UserSerializer.new(users)
    end

    def show
        user = current_user
        render json: UserSerializer.new(user)
    end

    def update

    end

    private

    def find_user
        User.find(params[:id])
    end

    def user_params
        params.permit(:email, :first_name, :last_name, :phone, :address, :password)
    end
end
