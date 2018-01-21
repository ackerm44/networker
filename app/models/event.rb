class Event < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :contacts, through: :organization
  accepts_nested_attributes_for :organization

  def presentable_date
    date.strftime("%B %d, %Y" )
  end

  def follow_up_display
    if follow_up == true
      "Yes"
    else
      "No"
    end
  end

end
