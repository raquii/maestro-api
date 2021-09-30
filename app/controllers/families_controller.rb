class FamiliesController < ApplicationController

    def current_ability
        @current_ability ||= FamilyAbility.new(current_user)
    end

    def index
        authorize! :index, Family
        @families = Family.accessible_by(current_ability)
        render json: FamilySerializer.new(@families)
    end

    def show
        @family = find_family
        authorize! :show, @family
        render json: FamilySerializer.new(@family)
    end

    def create
        @family = Family.new(studio_params)
        
        if can? :create, @family
            @family.save!
            render json: FamilySerializer.new(@family), status: :created
        end
    end

    def update
        @family = find_family
        if can? :edit, @family
            @family.update!(family_params)
            render json: FamilySerializer.new(@family)
        end
    end

    def destroy
        @family = find_family
        if can? :destroy, @family
            name = @family.name
            @family.destroy
            render json: {message: "#{name} Family has been deleted."}
        end
    end

    private

    def find_family
        Family.find(params[:id])
    end

    def family_params
        params.permit(:name)
    end
end
