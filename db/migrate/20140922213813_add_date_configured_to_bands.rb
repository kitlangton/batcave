class AddDateConfiguredToBands < ActiveRecord::Migration
  def change
    add_column :bands, :date_configured, :datetime
  end
end
