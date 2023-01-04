class CreateBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :balances do |t|
      t.references :user, index: true, null: false, foreign_key: true
      t.references :currencies, index: true, null: false, foreign_key: true
      t.integer :amount
      t.timestamps
    end
  end
end
