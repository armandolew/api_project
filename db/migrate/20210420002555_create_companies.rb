class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false, index: true
      t.string :token, null: false, index: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
