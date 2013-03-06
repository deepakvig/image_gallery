class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :caption
      t.text :description
      t.string :blog_link
      t.references :user

      t.timestamps
    end
    add_index :albums, :user_id
  end
end
