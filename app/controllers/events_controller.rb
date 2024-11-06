class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
    @is_creator = @event.creator == current_user

    @already_attendee = current_user ? @event.attendees.exists?(current_user.id) : false
    @event_attendance = @already_attendee ? @event.event_attendances.find_by(attendee_id: current_user.id) : EventAttendance.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.new(event_params)

    if @event.save
      redirect_to root_path, notice: "Success! New event created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])

    if @event.creator != current_user
      redirect_to root_path, alert: "You are not allowed to edit this event."
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.creator != current_user
      redirect_to root_path, alert: "You are not allowed to edit this event."
    end

    if @event.update(event_params)
      redirect_to @event, notice: "Event updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @event = Event.find(params[:id])

    if @event.creator != current_user
      redirect_to root_path, alert: "You are not allowed to delete this event."
    end

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
