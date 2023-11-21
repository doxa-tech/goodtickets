class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :code, index: { unique: true }
      t.boolean :used, default: false
      t.text :note

      t.integer :category
      t.integer :reduction
      t.integer :number

      t.timestamps
    end
  end
end
