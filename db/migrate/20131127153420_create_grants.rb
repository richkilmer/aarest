class CreateGrants < ActiveRecord::Migration
  def change
    create_table :grants do |t|
      t.integer :group_id,      null:false
      t.integer :service_id,    null:false
      t.string :right,          null:false
      t.string :resource_class
      t.integer :resource_identifier
      t.datetime :expires_at

      t.timestamps
    end
    add_index :grants, :group_id
    add_index :grants, :service_id
  end
end
