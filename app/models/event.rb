class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :date, presence: true
  validates :location, presence: true

  belongs_to :creator, class_name: "User"
  has_many :event_attendances
  has_many :attendees, through: :event_attendances, source: :attendee
end
