class Event < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :contacts, through: :organization

  accepts_nested_attributes_for :organization

  validates :name, presence: true

  def self.search_by_timeframe (current_user)
    Event.where(date: (Date.today - 30)..(Date.today), user_id: current_user)
  end

end
