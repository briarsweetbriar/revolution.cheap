class CreateSlideshowImages < ActiveRecord::Migration
  def change
    create_table :slideshow_images do |t|
      t.string :file
      t.integer :slideshow_id
      t.text :caption

      t.timestamps
    end
    add_index :slideshow_images, :slideshow_id
  end
end
