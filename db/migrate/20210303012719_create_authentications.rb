class CreateAuthentications < ActiveRecord::Migration[6.1]
  def change
    create_table :authentications do |t|
      t.references :user
      t.string :token, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
