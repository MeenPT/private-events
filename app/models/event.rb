class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :date, presence: true
  validates :location, presence: true
end
