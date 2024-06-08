class Order < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :discount
  has_many :payments
  belongs_to :tenant

end
