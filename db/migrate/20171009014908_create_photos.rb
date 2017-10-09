class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :body
      t.integer :purchase_id
      t.attachment :image
    end
  end
end
