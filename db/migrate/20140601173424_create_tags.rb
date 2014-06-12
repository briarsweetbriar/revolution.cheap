class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :slug
      t.integer :posts_count, null: false, default: 0
      t.integer :projects_count, null: false, default: 0

      t.timestamps
    end
    add_index :tags, :slug,                 unique: true
  end
end
