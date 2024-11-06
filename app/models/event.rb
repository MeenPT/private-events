class Event < ApplicationRecord
  scope :past, -> { where(date: ...Date.today).includes(:creator) }
  scope :upcoming, -> { where(date: Date.today...).includes(:creator) }

  belongs_to :creator, class_name: "User"
  has_many :event_attendances
  has_many :attendees, through: :event_attendances, source: :attendee

  validates :title, presence: true, length: { maximum: 255 }
  validates :date, presence: true
  validates :location, presence: true
end
