class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :check_current_user, only: [:show, :edit, :update, :destroy]

  def index
    @events = current_user.events.all.sort_by {|e| e.date}.reverse
    @events_by_timeframe = Event.search_by_timeframe(current_user.id)
  end

  def show
  end

  def new
    @event = Event.new
    @event.build_organization
    @event.organization.contacts.build
    @event.organization.contacts.build
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      @event.organization.contacts.build
      @event.organization.contacts.build
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
  def event_params
    event = params[:event]
    @event_date = Date.new event["date(1i)"].to_i, event["date(2i)"].to_i, event["date(3i)"].to_i
    if !event["follow_up_date(1i)"].empty?
      @follow_up_date = Date.new event["follow_up_date(1i)"].to_i, event["follow_up_date(2i)"].to_i, event["follow_up_date(3i)"].to_i
    end
    params.require(:event).permit(:name, :notes, :follow_up, :user_id, :organization_attributes => [:name, :location, :contacts_attributes => [:name, :phone, :email, :notes]]).merge(date: @event_date, follow_up_date: @follow_up_date)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def check_current_user
    @event = Event.find(params[:id])
    if current_user.id != @event.user_id
      redirect_to events_path
    end
  end

end
