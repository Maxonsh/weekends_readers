class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.text :content
      t.text :status
      t.integer :position
      t.timestamps null: false
    end
  end
end
