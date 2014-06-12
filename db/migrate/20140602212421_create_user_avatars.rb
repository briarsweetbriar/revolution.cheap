class CreateUserAvatars < ActiveRecord::Migration
  def change
    create_table :user_avatars do |t|
      t.string :file
      t.integer :user_id

      t.timestamps
    end
  end
end
