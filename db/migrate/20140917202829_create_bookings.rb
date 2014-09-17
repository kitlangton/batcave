class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :band, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
