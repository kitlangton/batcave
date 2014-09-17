class Band < ActiveRecord::Base
  has_many :bookings
  has_many :events, :through =>  :bookings

  validates :name, presence: true
end

