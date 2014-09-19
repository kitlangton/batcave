class Event < ActiveRecord::Base
  has_many :bookings
  has_many :bands, :through =>  :bookings
  accepts_nested_attributes_for :bands
  mount_uploader :image, ImageUploader

  validates :date, :time, presence: true

  def show_time
    Time.new(date.year, date.month, date.day, time.hour, time.min)
  end

end
