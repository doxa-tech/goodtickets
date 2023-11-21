class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :amount, default: 0
      t.bigint :order_id, index: { unique: true }
      t.integer :status, default: 0
      t.text :note

      t.belongs_to :user
      t.belongs_to :discount

      t.timestamps
    end
  end
end
