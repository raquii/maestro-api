class FamiliesController < ApplicationController

    def index
        families = current_user.studio.families
        render json: families
    end

    def show
        family = find_family
        render json: family
    end

    def update
        family = find_family
        family.update!(family_params)
        render json: family
    end

    def destroy
        family = find_family
        name = family.name
        family.destroy
        render json: {message: "#{name} Family has been deleted."}
    end

    private

    def find_family
        Family.find(params[:id])
    end

    def family_params
        params.permit(:name)
    end
end
