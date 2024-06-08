class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.jsonb :fields

      t.belongs_to :tenant
      t.timestamps
    end
  end
end
