require 'rails_helper'

RSpec.describe Event, :type => :model do
  let(:valid_event) { FactoryGirl.create(:event) }

  it "has a valid factory" do
    expect(valid_event).to be_valid
  end

  it "is invalid without a date" do
    dateless_event = FactoryGirl.build(:event, date: nil)
    expect(dateless_event).not_to be_valid
  end

  it "is invalid without a time" do
    timeless_event = FactoryGirl.build(:event, time: nil)
    expect(timeless_event).not_to be_valid
  end

  describe "it is associated with bands" do
    let(:valid_band) { FactoryGirl.create(:band) }

    before :each do
      valid_event.bookings.create(band_id: valid_band.id)
    end

    it "returns a list of booked bands" do
      expect(valid_event.bands).to include valid_band
    end
  end
end
