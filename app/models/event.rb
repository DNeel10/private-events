class Event < ApplicationRecord
  scope :upcoming, -> { where('date >= ?', DateTime.now) }
  scope :past, -> { where('date <= ?', DateTime.now) }

  belongs_to :creator, class_name: "User"

  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances, source: :event_attendee

end
