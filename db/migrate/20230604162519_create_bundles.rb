class CreateBundles < ActiveRecord::Migration[7.0]
  def change
    create_table :bundles do |t|
      t.string :name
      t.string :description, default: ""
      t.string :key
      t.jsonb :options

      t.belongs_to :tenant
      t.timestamps
    end
  end
end
