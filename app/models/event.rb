class Event < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :contacts, through: :organization

  accepts_nested_attributes_for :organization

  validates :name, :date, presence: true

end
