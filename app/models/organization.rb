class Organization < ApplicationRecord
  has_many :events
  has_many :contacts
  accepts_nested_attributes_for :contacts

  def contacts_attibutes=(contacts_attibutes)
    contacts_attributes.values.each do |contact_attribute|
      contact = Contact.find_or_create_by(contact_attribute)
      self.contacts << contact
    end
  end


end
