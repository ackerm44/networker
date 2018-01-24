module ApplicationHelper

  def presentable_date(date)
    date.strftime("%B %d, %Y" )
  end

end
