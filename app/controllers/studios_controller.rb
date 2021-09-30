class StudiosController < ApplicationController
    
    def current_ability
        @current_ability ||= StudioAbility.new(current_user)
    end

    def index
        authorize! :index, Studio
        @studios = Studio.accessible_by(current_ability)
        render json: StudioSerializer.new(@studios)
    end

    def show
        @studio = find_studio
        authorize! :show, @studio
        render json: StudioSerializer.new(@studio)
    end

    def create
        @studio = Studio.new(studio_params)
        
        if can? :create, @studio
            @studio.save!
            render json: StudioSerializer.new(@studio), status: :created
        end 
    end

    def update
        @studio = find_studio
        if can? :edit, @studio
            @studio.update!(studio_params)
            render json: StudioSerializer.new(@studio)
        end
    end

    private

    def studio_params
        params.permit(:name, :teacher_id)
    end

    def find_studio
        Studio.find(params[:id])
    end
end
