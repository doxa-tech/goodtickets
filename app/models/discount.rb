class Discount < ApplicationRecord

  has_one :order
  has_and_belongs_to_many :items

end
