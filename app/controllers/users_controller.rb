class UsersController < ApplicationController

  def show
    @follow_ups = current_user.follow_up_events.sort_by {|e| e.follow_up_date}
    @past_events = current_user.events.all.sort_by {|e| e.date}.reverse
  end
end
