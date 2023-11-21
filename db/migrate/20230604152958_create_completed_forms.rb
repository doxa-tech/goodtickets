class CreateCompletedForms < ActiveRecord::Migration[7.0]
  def change
    create_table :completed_forms do |t|
      t.belongs_to :form
      t.jsonb :fields

      t.timestamps
    end
  end
end
