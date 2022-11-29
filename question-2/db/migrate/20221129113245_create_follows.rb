class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followee_id
      t.timestamps null: false
    end
    # follows are unique between follower and followee
    add_index :follows, [:follower_id, :followee_id], unique: true
  end
end
