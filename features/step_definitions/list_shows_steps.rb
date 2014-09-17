Given(/^There are (\d+) events with bands$/) do |num_times|
  (num_times.to_i).times do
    new_event = FactoryGirl.create(:event)
    new_band = FactoryGirl.create(:band)
    new_event.bookings.create(band_id: new_band.id)
  end
end

When(/^I visit "(.*?)"$/) do |page|
  visit page
end

Then(/^the page should have content "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end

Then(/^the page should list all the events$/) do
  Event.all.each do |event|
    expect(page).to have_content(event.date.strftime("%B %d"))
    expect(page).to have_content(event.time.strftime("%l:%M %p"))
  end
end

Then(/^the page should list all the bands for each event$/) do
  Event.all.each do |event|
    event.bands.each do |band|
      expect(page).to have_content(band.name)
    end
  end
end
