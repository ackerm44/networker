class Organization < ApplicationRecord
  has_many :events
  has_many :contacts
end
