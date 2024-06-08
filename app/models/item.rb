class Item < ApplicationRecord

  has_and_belongs_to_many :bundles
  has_and_belongs_to_many :discounts
  belongs_to :tenant

end
