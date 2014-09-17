require 'rails_helper'

RSpec.describe Band, :type => :model do
  let(:valid_band) { FactoryGirl.create(:band) }

  it "has a valid factory" do
    expect(valid_band).to be_valid
  end

  it "is invalid without a name" do
    valid_band.name = nil
    expect(valid_band).not_to be_valid
  end

  describe "it is associated with events" do

    let(:valid_event) { FactoryGirl.create(:event) }

    before :each do
      valid_band.bookings.create(event_id: valid_event.id)
    end

    it "returns a list of booked events" do
      expect(valid_band.events).to include valid_event
    end
  end
end
