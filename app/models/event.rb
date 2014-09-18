class Event < ActiveRecord::Base
  has_many :bookings
  has_many :bands, :through =>  :bookings
  accepts_nested_attributes_for :bands

  validates :date, :time, presence: true
end
