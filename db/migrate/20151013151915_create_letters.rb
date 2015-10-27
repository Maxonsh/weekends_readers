class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.text :content, null: false
      t.text :status, null: false
      t.integer :position, null: false
      t.timestamps null: false
    end

    add_index :letters, [:position], unique: true
  end
end
