class Organization < ApplicationRecord
  has_many :events
  has_many :contacts
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

  def self.search_by_location(query)
    if query.present?
      Organization.all.select do |organization|
        organization.location.downcase.include? query
      end
    end
  end


end
