class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name,           null:false
      t.string :host,           null:false
      t.boolean :active,        default: true, null:false
      t.string :key,            null:false

      t.timestamps
    end
    add_index :services, :name, unique: true
    add_index :services, :key
  end
end
