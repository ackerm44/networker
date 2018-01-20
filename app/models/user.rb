class User < ApplicationRecord
  has_many :events
  has_many :organizations, through: :events

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def follow_up_events
    events.find_all {|e| e.follow_up == true}
  end
end
