class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :nit
      t.string :contact_person_name
      t.string :contact_person_phone
      t.references :bank, null: false, foreign_key: true

      t.timestamps
    end
    add_index :suppliers, :nit
  end
end
