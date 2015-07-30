class ChangeDefaultForPhotoLikes < ActiveRecord::Migration
  def change
    change_column :photos, :likes, :integer, :default => 0
  end
end
