class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @event.build_organization
    #@event.organization.contacts.build
    #@event.organization.contacts.build
  end

  def create
    #raise params.inspect
    event = params[:event]
    date = Date.new event["date(1i)"].to_i, event["date(2i)"].to_i, event["date(3i)"].to_i
    @event = Event.new(name: event_params[:name], date: date, notes: event_params[:notes], user_id: event_params[:user_id] user_id: event_params[:user_id], organization_id: )
    #binding.pry
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def delete

  end

  private
  def event_params
    params.require(:event).permit(:name, "date(1i)", "date(1i)", "date(1i)", :notes, :user_id, :organization_attributes => [:name, :location])
  end


end


# {"utf8"=>"✓",
#   "authenticity_token"=>"ekxqYeWCY4ak0Og5P8XEsFMWuY+7CwMUAfMczfpb2djQYqypj9NN9jmgIGVw3btt43fovddVmGrYwTdtskYIfw==",
#   "event"=>{
#     "name"=>"test",
#     "date(1i)"=>"2018",
#     "date(1i)"=>"1",
#     "date(1i)"=>"11",
#     "notes"=>"test notes "
#   },
#   "commit"=>"Create Event",
#   "controller"=>"events", "action"=>"create"} permitted: false>
