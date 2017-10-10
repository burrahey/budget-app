class Purchase < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :description, :amount, :user_id, :date_purchased

  def self.monthly_purchases(current_user_id)
    Purchase.where("user_id = ? AND date_purchased > ?", current_user_id, Date.today - 30).order(date_purchased: :desc)
  end
end
