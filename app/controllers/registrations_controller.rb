class RegistrationsController < Devise::RegistrationsController
    respond_to :json
    before_action :configure_permitted_parameters

    def new
      # Override Devise default behaviour and create a profile as well
      build_resource({})
      resource.build_profile
      respond_with self.resource
    end
  
    protected
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :password_confirmation, :role, teacher_profile_attributes:[:first_name, :last_name, :email, :phone, :address]])
    end

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
