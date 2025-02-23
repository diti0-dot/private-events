class EventAttendeesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      event = Event.find(params[:event_id])
      event.attendees << current_user
      redirect_to event, notice: "You are now attending this event."
    end
  
    def destroy
      event = Event.find(params[:event_id])
      event.attendees.delete(current_user)
      redirect_to event, notice: "You have been removed from this event."
    end
  end
  