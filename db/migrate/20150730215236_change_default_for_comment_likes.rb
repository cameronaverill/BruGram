class ChangeDefaultForCommentLikes < ActiveRecord::Migration
  def change
    change_column :comments, :likes, :integer, :default => 0
  end
end
