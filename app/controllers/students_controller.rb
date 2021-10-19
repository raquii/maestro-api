class StudentsController < ApplicationController

    def index
        @students = StudentProfile.accessible_by(current_ability)
        render json: StudentProfileSerializer.new(@students)
    end

    def create
        @student = StudentProfile.new(student_profile_params)

        if can? :create, @student
            if params[:student_profile][:family_id].blank?
                @family = Family.new(studio:current_user.studio)
                @student.family = @family
            else
                @family = Family.find(params[:family_id])
                @student.family = @family
            end
            
            @family.save!
            @student.save!
           
            unless params[:guardian_profile_a][:first_name].blank?
                @guardian_a = GuardianProfile.new(guardian_profile_params(:guardian_profile_a))
                @guardian_a.family = @family
                @guardian_a.save!
            end
     
            unless params[:guardian_profile_b][:first_name].blank?
                @guardian_b = GuardianProfile.new(guardian_profile_params(:guardian_profile_b))
                @guardian_b.family = @family
                @guardian_b.save!
            end

            render json: StudentProfileSerializer.new(@student), status: :created
        end
    end

    def update
        @student = find_student_profile

        authorize! :edit, @student
        @student.update!(student_params)
        render json: StudentProfileSerializer.new(@student)
    end

    def destroy
        @student = find_student_profile
        @id = @student.id

        if can? :destroy, @student
            family = student.family
            if family.students.count <= 1
                family.destroy!
            else
                @student.destroy!
            end
            render json: {id: @id}
        end
    end

    def bulk_update        
        students = find_students
      if students.all?{|s| can? :update, s}
            if params[:status]
                students.update_all(status:params[:status])  
            else
                students.update_all(make_up_credits:params[:make_up_credits])  
            end     
            render json: StudentProfileSerializer.new(students)
        end
    end

    def bulk_destroy
        students = find_students

        if students.all?{|s| can? :destroy, s}
            students.each do |student|
                family = student.family
                if family.students.count <= 1
                    family.destroy!
                else
                    student.destroy!
                end
            end
            render json: StudentProfileSerializer.new(current_user.students)
        end
    end
    
    private 

    def guardian_profile_params(symbol)
        params.require(symbol).permit(:id, :first_name, :last_name, :email, :phone, :address, :family_id, :studio_id, :lesson_reminder_emails, :lesson_reminder_sms)
    end

    def student_profile_params
        params.require(:student_profile).permit(:id, :first_name, :last_name, :email, :phone, :address, :family_id, :studio_id, :grade, :adult, :make_up_credits, :status, :school, :notes,:default_lesson_duration, :default_lesson_price, :birthday, :gender, :lesson_reminder_emails, :lesson_reminder_sms)
    end

    def find_student_profile
        StudentProfile.find(params[:id])
    end

    def find_students
        StudentProfile.where(id: params[:ids])
    end
    
end
