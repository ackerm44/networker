module EventHelper

  def past_due(event)
    if !event.follow_up_date.nil?
      if event.follow_up_date < Date.today
        link_to "PAST DUE", event_path(event)
      else
        link_to event.name, event_path(event)
      end
    else
      link_to event.name, event_path(event)
    end
  end
end
