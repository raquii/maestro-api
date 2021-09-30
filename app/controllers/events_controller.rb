class EventsController < ApplicationController

    def current_ability
        @current_ability ||= EventAbility.new(current_user)
    end
        
    def index
        authorize! :index, Event
        @events = Event.accessible_by(current_ability)
        render json: EventSerializer.new(@events)
    end

    def show
        @event = find_event
        authorize! :show, Event
        render json: EventSerializer.new(@event)
    end

    def create
        @event = Event.new(event_params)

        if can? :create, @event
            @event.save!
            render json: EventSerializer.new(@event)
        end
    end

    def update
        @event = find_event
        if can? :edit, @event
            @event.update!(event_params)
            render json: EventSerializer.new(@event)
        end
    end

    def destroy
        @event = find_event
        if can? :destroy, @event
            title = @event.title
            @event.destroy
            render json: {message: "#{title} has been deleted."}
        end
    end

    private

    def find_event
        Event.find(params[:id])
    end

    def event_params
        params.permit(:teacher_id, :student_id, :all_day, :start, :end, :start_time, :end_time, :start_recur, :end_recur, :title, :allow_registration, :type, :attendance, :visible, :location, :price)
    end
end
