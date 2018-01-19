class Event < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  accepts_nested_attributes_for :organization

  def contacts_attibutes=(contacts_attibutes)
    
  end


end
