class AddPlaylistUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :playlist_url, :string
  end
end
