class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to root_path, notice: "Success! New event created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
  end


  def destroy
    @event = Event.find(params[:id])

    if @event.destroy
      redirect_to root_path, notice: "Event delete."
    else
      redirect_to @event, alert: "Failed to delete the event. Try again later.", status:
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :location, :extra_information)
  end
end
