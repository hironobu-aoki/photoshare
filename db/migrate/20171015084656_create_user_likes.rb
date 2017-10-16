class CreateUserLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_likes do |t|
      t.references :user, foreign_key: true
      t.references :photo, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :photo_id], unique: true
    end
  end
end
