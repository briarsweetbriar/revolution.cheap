class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :slug
      t.string :website
      t.string :source
      t.text :description

      t.timestamps
    end
    add_index :projects, :slug
  end
end
