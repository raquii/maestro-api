class TeacherProfilesController < ApplicationController
    def update
        @teacher = current_user.teacher_profile
        if can? :update, @teacher
            @teacher.update(teacher_profile_params)
        end
    end
end
