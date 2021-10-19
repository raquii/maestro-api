class GuardianProfilesController < ApplicationController
    def index
        @guardians = GuardianProfile.accessible_by(current_ability)
        render json: GuardianProfileSerializer.new(@guardians)
    end

    def create
        @guardian = GuardianProfile.new(guardian_profile_params)
        @guardian.studio = current_user.studio
        
        if can? :create, @guardian
            @guardian.save!
            render json: GuardianProfileSerializer.new(@guardian), status: :created
        end

    end

    def update
        @guardian = find_guardian_profile
        if can? :update, @guardian
            @guardian.update(guardian_profile_params)
            render json: GuardianProfileSerializer.new(@guardian)
        end
    end

    def destroy
        @guardian = find_guardian_profile
        if can? :destroy, @guardian
            @guardian.destroy
            render json: {message: "Guardian deleted successfully."}, status: :ok
        end
    end

    private

    def find_guardian_profile
        GuardianProfile.find(params[:id])
    end

    def guardian_profile_params
        params.permit(:id, :first_name, :last_name, :email, :phone, :address, :family_id, :studio_id, :lesson_reminder_emails, :lesson_reminder_sms)
    end
end
