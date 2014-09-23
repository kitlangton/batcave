class AddSoundCloudUrlToBands < ActiveRecord::Migration
  def change
    add_column :bands, :sound_cloud_url, :string
  end
end
