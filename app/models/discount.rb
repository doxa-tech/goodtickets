class Discount < ApplicationRecord

  has_and_belongs_to_many :orders
  has_and_belongs_to_many :items
  belongs_to :tenant

end
