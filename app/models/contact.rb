class Contact < ApplicationRecord
  belongs_to :organization

  def self.search_by_name(query)
    if query.present?
      Contact.all.select do |contact|
        contact.name.downcase.include? query
      end
    end
  end
  
end
