class CreateDiscountsItems < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts_items, id: false do |t|
      t.belongs_to :discount
      t.belongs_to :item
    end
  end
end
