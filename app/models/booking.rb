class Booking < ActiveRecord::Base
  belongs_to :band
  belongs_to :event
  accepts_nested_attributes_for :band
end
