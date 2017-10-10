class User < ActiveRecord::Base
  has_secure_password
  has_many :purchases
  validates_presence_of :username, :password_digest, :email, :monthly_budget

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
end
