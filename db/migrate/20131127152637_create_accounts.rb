class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name,     null:false
      t.boolean :active,  default: true, null:false

      t.timestamps
    end
    add_index :accounts, :name, unique: true
  end
end
