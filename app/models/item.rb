class Item < ApplicationRecord

  belongs_to :items_bundle
  has_and_belongs_to_many :discounts

end
