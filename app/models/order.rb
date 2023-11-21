class Order < ApplicationRecord

  belongs_to :user
  belongs_to :discount
  has_many :payments

end
