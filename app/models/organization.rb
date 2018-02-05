class Organization < ApplicationRecord
  has_many :events
  has_many :contacts
  has_many :user, through: :events
  accepts_nested_attributes_for :contacts, reject_if: proc { |attributes| attributes['name'].blank? }

  validates :name, uniqueness: true

  def contacts_attibutes=(contacts_attibutes)
    if !contacts_attributes.name.empty?
      contacts_attributes.values.each do |contact_attribute|
        contact = Contact.find_or_create_by(contact_attribute)
        self.contacts << contact
      end
    end
  end

  def self.search_by_location(query, current_user)
    self.select do |organization|
      (organization.user_ids[0] == current_user) && (organization.location.downcase.include? query)
    end
  end

end
