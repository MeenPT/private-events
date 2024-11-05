class EventAttendance < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: "User"

  validates :attendee_id, presence: true
  validates :event_id, presence: true

  validates_associated :event
  validates_associated :attendee
end
