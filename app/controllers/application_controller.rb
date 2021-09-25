class ApplicationController < ActionController::API
    include ActionController::MimeResponds
    respond_to :json
    before_action :authenticate_user!
    check_authorization unless: :devise_controller?

    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :password, :password_confirmation, :first_name, :last_name, :address, :phone, :role, :family_id])
    end
    
end
