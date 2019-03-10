class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations, id: false do |t|
      t.string :id, primary_key: true, null: false
      t.string :type, null: false
      t.string :title, null: false
      t.json :parameters, default: {}
      t.json :input, default: {}
      t.json :output, default: {}

      t.timestamps
    end
    add_index :operations, :id, unique: true
    add_index :operations, :type
  end
end
