class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.jsonb :fields

      t.timestamps
    end
  end
end
