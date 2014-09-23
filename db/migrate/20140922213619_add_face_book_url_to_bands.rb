class AddFaceBookUrlToBands < ActiveRecord::Migration
  def change
    add_column :bands, :facebook_url, :string
  end
end
