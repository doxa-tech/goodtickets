class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.integer :refund_amount
      t.integer :method
      t.integer :payment_type
      t.datetime :time
      t.integer :state
      t.integer :refund_state
      t.bigint :payment_id

      t.belongs_to :order
      t.belongs_to :tenant
      t.timestamps
    end
  end
end
