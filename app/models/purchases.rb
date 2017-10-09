class Purchase < ActiveRecord::Base
  belongs_to :user
  has_one :photo
  validates_presence_of :description, :amount, :user_id, :date_purchased

end
