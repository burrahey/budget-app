class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :body
      t.integer :purchase_id
      t.string :file_name
      t.string :content_type
      t.integer :file_size
      t.datetime :updated_at
    end
  end
end
