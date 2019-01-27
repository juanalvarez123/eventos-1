class EventsController < ApplicationController
  def index
    @events = Event.all.sort { |a, b| b.created_at <=> a.created_at }
  end

  def new
    @categories = Array['Conferencia', 'Seminario', 'Congreso', 'Curso']
    @types = Array['Presencial', 'Virtual']
  end

  def create
    @event = Event.new(params.require(:event).permit(:name, :category, :location, :address, :event_type, :date_init, :date_end))
    @event.save
    redirect_to @event
  end

  def show
    @event = Event.find(params[:id])
  end
end
