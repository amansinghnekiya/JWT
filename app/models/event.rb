class Event < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :favourites
  validates :title, presence: true, length: { maximum: 30 }
  validates :date, presence: true
  validates :location, presence: true, length: { maximum: 40 }
  validates :ticket_availability, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence:true, numericality: { greater_than_or_equal_to: 1 }
  enum category: { music: 0, standup: 1, sport: 2}
  validates :category, inclusion: { in: categories.keys }
end
