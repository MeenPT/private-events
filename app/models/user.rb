class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :created_events, foreign_key: "creator_id", class_name: "Event"

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
