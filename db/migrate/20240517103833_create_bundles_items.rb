class CreateBundlesItems < ActiveRecord::Migration[7.0]
  def change
    create_table :bundles_items do |t|
      t.belongs_to :bundle
      t.belongs_to :item
    end
  end
end
