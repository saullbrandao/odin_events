class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
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
      redirect_to @event, notice: "Your event was created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    
    def event_params
      params.require(:event).permit(:title, :description, :location, :date)
    end
end
