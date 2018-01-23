class Event < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :contacts, through: :organization

  accepts_nested_attributes_for :organization

  validates :name, :date, presence: true

  def presentable_date(date)
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
