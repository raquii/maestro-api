class TeacherProfilesController < ApplicationController
    def update
        byebug
        @teacher = TeacherProfile.find(params[:id])
        if can? :update, @teacher
            @teacher.update(teacher_profile_params)
        end
    end

    private

    def teacher_profile_params
        params.permit(:first_name, :last_name, :email, :phone, :address, studio_attributes:[:name])
    end
end
