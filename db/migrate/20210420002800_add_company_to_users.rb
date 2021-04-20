class AddCompanyToUsers < ActiveRecord::Migration[6.1]
  def up
    add_reference :users, :company, index: true, foreign_key: true
  end

  def down
    remove_reference :users, :company, index: true, foreign_key: true
  end
end
