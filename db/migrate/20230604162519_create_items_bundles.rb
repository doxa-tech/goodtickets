class CreateItemsBundles < ActiveRecord::Migration[7.0]
  def change
    create_table :items_bundles do |t|
      t.string :name
      t.string :description, default: ""
      t.string :key
      t.jsonb :options
      t.integer :limit

      t.timestamps
    end
  end
end
