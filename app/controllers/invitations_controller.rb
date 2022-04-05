class InvitationsController < ApplicationController
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
    @event = @invitation.event.id
    @invitation.destroy

    redirect_to event_path(@event)
  end
end
