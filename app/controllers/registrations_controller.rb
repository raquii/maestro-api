class RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    private

    def respond_with(resource, _opts = {})
        register_success && return if resource.persisted?
    
        register_failed
    end

    def register_success
        if(current_user.teacher?)
            Studio.create!(name: "#{current_user.first_name} #{current_user.last_name}'s Studio", teacher: current_user)
        end

        render json: UserSerializer.new(current_user), status: :ok
    end

    def register_failed
        render json: { errors: resource.errors.full_messages}, status: :bad_request
    end

    
end
