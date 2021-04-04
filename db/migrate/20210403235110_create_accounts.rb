class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.integer :customer_id
      t.integer :balance
      t.text :perks

      t.timestamps
    end
  end
end
