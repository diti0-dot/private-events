class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
  
    def index
      @past_events = Event.past
      @upcoming_events = Event.upcoming
    end
  
    def show
      @event = Event.find(params[:id])
    end
  
    def new
      @event = current_user.created_events.build
    end
  
    def create
      @event = current_user.created_events.build(event_params)
      if @event.save
        redirect_to @event, notice: "Event created successfully."
      else
        render :new
      end
    end
  
    private
  
    def event_params
      params.require(:event).permit(:title, :description, :date)
    end
  end
  