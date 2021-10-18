class RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    private

    def respond_with(resource, _opts = {})
        register_success && return if resource.persisted?
    
        register_failed
    end

    def register_success
        if current_user.teacher?
            render json: TeacherProfileSerializer.new(current_user.teacher_profile), status: :ok
        else
            render json: UserSerializer.new(current_user), status: :ok
        end
    end

    def register_failed
        render json: { errors: resource.errors.full_messages}, status: :bad_request
    end

end
