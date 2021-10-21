class ApplicationController < ActionController::API
    include ActionController::MimeResponds
    respond_to :json
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_response_invalid
    
    protected

    rescue_from CanCan::AccessDenied do |exception|
      Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
      respond_to do |format|
        format.json { render json: {message: 'Not Found'}, status: :not_found }
      end
    end
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:login, keys: [:email, :encrypted_password, :password_confirmation, :role,])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :password_confirmation, :role, teacher_profile_attributes:[:first_name, :last_name, :email, :phone, :address]])
    end

    def render_response_not_found
      render json: { errors: "Not found."}, status: :not_found
    end

    def render_response_invalid(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
    
end
