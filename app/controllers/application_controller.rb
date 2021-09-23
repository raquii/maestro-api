class ApplicationController < ActionController::API
    include ActionController::MimeResponds
    respond_to :json

    check_authorization unless: :devise_controller?
    
end
