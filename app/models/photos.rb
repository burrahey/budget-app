class Photo < ActiveRecord::Base
  has_one :purchase
  has_many :users, through: :purchases


end
