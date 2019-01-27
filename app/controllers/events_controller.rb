class EventsController < ApplicationController

  @@categories = Array['Conferencia', 'Seminario', 'Congreso', 'Curso']
  @@types = Array['Presencial', 'Virtual']

  def index
    @events = Event.all.sort { |a, b| b.created_at <=> a.created_at }
  end

  def new
    @categories = @@categories
    @types = @@types
  end

  def create
    @event = Event.new(eventParameters)
    @event.save
    redirect_to @event
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @categories = @@categories
    @types = @@types
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(eventParameters)
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private def eventParameters
    params.require(:event).permit(:name, :category, :location, :address, :event_type, :date_init, :date_end)
  end
end
