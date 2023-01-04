class CreateMailers < ActiveRecord::Migration[7.0]
  def change
    create_table :mailers do |t|
      t.string :email, :null => false
      t.string :pin, :null => false
      t.column :status, :integer, :default => 0
      t.timestamps
    end
  end
end
