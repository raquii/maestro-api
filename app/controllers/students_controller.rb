class StudentsController < ApplicationController
    load_and_authorize_resource :user, parent: false

    def current_ability
        @current_ability ||= UserAbility.new(current_account).merge(StudentProfileAbility.new(current_user))
    end
    
    def index
        if current_user.teacher?
            students = current_user.students
        elsif current_user.guardian?
            students = current_user.children
        end
        render json: StudentSerializer.new(students)
    end

    def show
    end
end
