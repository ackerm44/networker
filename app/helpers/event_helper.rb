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

  def display_follow_up_date(event)
    if !event.follow_up_date.nil?
      presentable_date(event.follow_up_date)
    else
      "N/A"
    end
  end

  def follow_up_display(event)
    if event.follow_up == true
      "Yes"
    else
      "No"
    end
  end
end
