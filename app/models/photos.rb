class Photo < ActiveRecord::Base
  include Paperclip::Glue
  has_one :purchase
  has_many :users, through: :purchases

  has_attached_file :image, styles: { small: "100x100", med: "200x200", large: "400x400" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
