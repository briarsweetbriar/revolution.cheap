class CreateProjectLogos < ActiveRecord::Migration
  def change
    create_table :project_logos do |t|
      t.string :file
      t.integer :project_id

      t.timestamps
    end
    add_index :project_logos, :project_id
  end
end
