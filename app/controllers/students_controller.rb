class StudentsController < ApplicationController
  
    def current_ability
        @current_ability ||= UserAbility.new(current_user).merge(StudentProfileAbility.new(current_user))
    end
    
    def index

        if current_user.teacher?
            @students = current_user.students
        elsif current_user.guardian?
            @students = current_user.children
        end
      
        render json: StudentSerializer.new(@students)
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

        authorize! :edit, @student
        @student.update!(student_params)
        render json: StudentSerializer.new(@student)
    end

    def destroy
        @student = find_student
        if can? :destroy, @student
            @student.destroy
            render json: {message: "User deleted"}
        end
    end

    def bulk_update        
        students = find_students
        profiles = find_student_profile
      
        if students.all?{|s| can? :update, s}
            profiles.update_all(status: params[:students][:status])       
            render json: StudentSerializer.new(students)
        end
    end

    def bulk_destroy
        students = find_student
        if students.all?{|s| can? :destroy, s}
            students.destroy_all
            render json: {message: "Successfuly deleted."}
        end
    end
    
    private 

    def student_params
        params.permit(:id, :first_name, :last_name, :email, :phone, :address, :family_id, :role, student_profile:[:grade, :make_up_credits, :status, :adult, :student, :default_lesson_duration, :default_lesson_price, :birthday, :gender])
    end

    def profile_params
        params.require(:student_profile).permit(:grade, :make_up_credits, :status, :adult, :student, :default_lesson_duration, :default_lesson_price, :birthday, :gender)
    end

    def find_student
        User.find(params[:id])
    end

    def find_students
        User.where(id: params[:students][:ids])
    end

    def find_student_profile
       StudentProfile.where(id: params[:students][:profile_ids])
    end    
    
end
