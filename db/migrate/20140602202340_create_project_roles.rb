class CreateProjectRoles < ActiveRecord::Migration
  def change
    create_table :project_roles do |t|
      t.string :title
      t.string :name
      t.integer :user_id
      t.integer :project_id
      t.string :website

      t.timestamps
    end
    add_index :project_roles, :user_id
    add_index :project_roles, :project_id
  end
end
