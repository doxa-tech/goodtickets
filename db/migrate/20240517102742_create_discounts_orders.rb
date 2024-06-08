class CreateDiscountsOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts_orders do |t|
      t.belongs_to :discount
      t.belongs_to :order
    end
  end
end
