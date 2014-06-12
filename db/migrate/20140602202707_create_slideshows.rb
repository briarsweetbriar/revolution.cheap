class CreateSlideshows < ActiveRecord::Migration
  def change
    create_table :slideshows do |t|
      t.string :title
      t.string :slideshowable_type
      t.integer :slideshowable_id

      t.timestamps
    end
    add_index :slideshows, [:slideshowable_id, :slideshowable_type]
  end
end
