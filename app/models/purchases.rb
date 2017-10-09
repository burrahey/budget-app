class Purchase < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :description, :amount, :user_id

end
