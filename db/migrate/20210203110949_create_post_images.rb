class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.integer "image_album_id", null: false
      t.string "image_id"

      t.timestamps
      t.index ["image_album_id"], name: "index_post_images_on_image_album_id"
    end
  end
end

