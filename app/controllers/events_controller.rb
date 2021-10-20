class EventsController < ApplicationController
        
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
        @event.teacher_profile = current_user.teacher_profile

        if can? :create, @event
            @event.save!
            render json: EventSerializer.new(@event)
        end
    end

    def create_recurring_event
        @group = RecurringGroup.new(recurring_group_params)
        @event = Event.new(recurring_event_params)
        @event.teacher_profile = current_user.teacher_profile

        if can? :create, @event
            @group.save!
            @event.recurring_group=@group
            @event.save!
            @event.generate_recurrent_events
            @recurrent_events = @group.events.limit(30)
            render json: EventSerializer.new(@recurrent_events)
        end
    end

    def update
        byebug
        @event = find_event
        if can? :edit, @event
            @event.update!(event_params)
            render json: EventSerializer.new(@event)
        end
    end

    def update_all_event_occurances
        byebug
        @events = find_all_occurances
        byebug
        if @events
            render json: {message: 'got em'}
        end
    end

    def update_future_event_occurances
        byebug
        @events = find_future_occurances
        byebug
        if @events
            render json: {message: 'got em'}
        end
    end

    def destroy
        @event = find_event
        if can? :destroy, @event
            id = @event.id
            @event.destroy
            render json: {id: id, message: "event deleted"}
        end
    end

    def destroy_all_event_occurances
        byebug
        @events = find_all_occurances
        byebug
        if @events
            render json: {message: 'got em'}
        end
    end

    def destroy_future_event_occurances
        byebug
        @events = find_future_occurances
        byebug
        if @events
            render json: {message: 'got em'}
        end
    end

    private

    def find_event
        Event.find(params[:id])
    end

    def find_all_occurances
        Event.where({recurring_group_id: params[:event][:recurring_group_id]})
    end

    def find_future_occurances
        Event.where({recurring_group_id: params[:event][:recurring_group_id]}).where('start >= ?', params[:event][:start])
    end

    def event_params
        params.permit(:teacher_profile_id, :student_profile_id, :all_day, :start, :end, :recurring_group_id, :title, :allow_registration, :event_type, :attendance, :visible, :location, :price, :make_up_credit_required, :default_lesson, recurring_group:[:end_date])
    end

    def recurring_event_params
        params.require(:event).permit(:teacher_profile_id, :student_profile_id, :all_day, :start, :end, :recurring_group_id, :title, :allow_registration, :event_type, :attendance, :visible, :location, :price, :make_up_credit_required, :default_lesson)
    end

    def recurring_group_params
        params.require(:recurring_group).permit(:end_date)
    end
end
