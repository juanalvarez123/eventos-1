class EventsController < ApplicationController

  @@categories = Array['Conferencia', 'Seminario', 'Congreso', 'Curso']
  @@types = Array['Presencial', 'Virtual']

  def index
    if session[:current_user_id]
      @user = User.find(session[:current_user_id])
      @events = Event.all.where(user_id: session[:current_user_id]).sort { |a, b| b.created_at <=> a.created_at }
    else
      redirect_to login_path
    end
  end

  def new
    if session[:current_user_id]
      @categories = @@categories
      @types = @@types
    else
      redirect_to login_path
    end
  end

  def create
    if session[:current_user_id]
      @event = Event.new(eventParameters)
      @event.user_id = session[:current_user_id]
      @event.save
      redirect_to @event
    else
      redirect_to login_path
    end
  end

  def show
    if session[:current_user_id]
      @event = Event.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def edit
    if session[:current_user_id]
      @categories = @@categories
      @types = @@types
      @event = Event.find(params[:id])
    else
      redirect_to login_path
    end
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
