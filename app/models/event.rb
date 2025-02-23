class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
    has_many :event_attendees
    has_many :attendees, through: :event_attendees, source: :attendee
  
    scope :past, -> { where("date < ?", Time.current) }
    scope :upcoming, -> { where("date >= ?", Time.current) }
  end
  