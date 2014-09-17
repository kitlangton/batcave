class Event < ActiveRecord::Base
  has_many :bookings
  has_many :bands, :through =>  :bookings

  validates :date, :time, presence: true
end
