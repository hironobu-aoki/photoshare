class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.references :user
      t.text :image
      t.string :photo_comment

      t.timestamps
    end
  end
end
