class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :account_id,    null:false
      t.boolean :active,        default: true, null:false
      t.string :email,          null:false
      t.string :password_digest
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :account_id
  end
end
