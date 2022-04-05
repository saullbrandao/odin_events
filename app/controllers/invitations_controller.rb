class InvitationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @invitation = Invitation.new(event_id: @event.id, user_id: current_user.id)

    if @invitation.save
      flash[:notice] = "Added to the attendees list!"
      redirect_to @event
    else
      flash[:alert] = "Something went wrong."
      redirect_to @event
    end
  end
  
  def destroy
    @invitation = Invitation.find(params[:id])
    @event = @invitation.event

    if current_user == @event.creator
      flash[:alert] = "The creator of the event cannot be removed from the attendees list."
      redirect_to @event
    else
      @invitation.destroy
      redirect_to @event
    end
  end
end
