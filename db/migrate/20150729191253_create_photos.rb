class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.boolean :public
      t.text :caption
      t.string :image
      t.integer :likes, :default => 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
