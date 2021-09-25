class EventsController < ApplicationController

    def current_ability
        @current_ability ||= EventAbility.new(current_user)
    end

    def index
       
    end
end
