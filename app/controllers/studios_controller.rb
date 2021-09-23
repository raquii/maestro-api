class StudiosController < ApplicationController
    def show
        studio = find_studio
        render json: studio
    end

    def update
        studio = find_studio
        studio.update!(studio_params)
        render json: studio
    end

    private

    def studio_params
        params.permit(:name
    end

    def find_studio
        Studio.find(params[:id])
    end
end
