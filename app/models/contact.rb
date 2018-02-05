class Contact < ApplicationRecord
  belongs_to :organization
  has_many :events, through: :organization

  def self.search_by_name(query, current_user)
    self.select do |contact|
      (contact.organization.user_ids[0] == current_user) && (contact.name.downcase.include? query)
    end
  end

end
