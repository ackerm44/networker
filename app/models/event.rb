class Event < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :contacts, through: :organization
  accepts_nested_attributes_for :organization

  # def contacts_attibutes=(contacts_attibutes)
  #
  # end

  def presentable_date
    date.strftime("%B %d, %Y" )
  end

end
