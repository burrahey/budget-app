class AddDateToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :date_purchased, :date
  end
end
