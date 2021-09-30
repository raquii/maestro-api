class StudentsController < ApplicationController

    def current_ability
        @current_ability ||= UserAbility.new(current_account).merge(StudentProfileAbility.new(current_user))
    end
    
    def index
        if current_user.teacher?
            @students = current_user.students
        elsif current_user.guardian?
            @students = current_user.children
        end

        if can? :index, @students
            render json: StudentSerializer.new(@students)
        end
    end

    def create
        @student = User.new(student_params)

        if can? :create, @student
            @student.save!
            render json: StudentSerializer.new(@student), status: :created
        end
    end

    def update
        @student = find_student

        if can? :edit, @student
            @student.update!(student_params)
            render json: StudentSerializer.new(@student)
        end
    end

    def destroy
        @student = find_student
        if can? :destroy, @student
            @student.destroy
            render json: {message: "User deleted"}
        end
    end
    
    private 

    def student_params
        params.permit(:first_name, :last_name, :email, :phone, :address, :family_id, :role)
    end

    def find_student
        User.find(params[:id])
    end

    
end
