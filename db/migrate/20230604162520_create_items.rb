class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description, default: ""
      t.integer :price
      t.integer :number
      t.boolean :active
      t.datetime :active_from
      t.datetime :active_until
      t.integer :limit
  
      t.belongs_to :items_bundle
      t.belongs_to :tenant
      t.timestamps
    end
  end
end
