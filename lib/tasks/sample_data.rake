namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_bands
    make_events
    make_bookings
  end
end

def make_bands
  names = [ "Microwave Death", "Bible Gun", "Okay Banditos", "Linda Everswick", "Pukey", "Mr. Bongo", "Jay Z", "Sufjan Stevens", "Eminem", "Creed", "Nickelback", "Bilbo Baggins", "Spiderman", "Franz Kafka", "Fillmore", "Delorean", "Butthole Surfers"]
  30.times do |n|
    name  = names.sample(1)[0]
    Band.create!(name: name)
  end
end

def make_events
  15.times do |i|
    date = Date.today.advance(days: i)
    time = Time.now
    Event.create!(date: date, time: time)
  end
end

def make_bookings
  events = Event.all
  bands = Band.all
  events.each.with_index do |event, index|
    bands.rotate(index)[0..4].each do |band|
      event.bookings.create!(band_id: band.id)
    end
  end
end


