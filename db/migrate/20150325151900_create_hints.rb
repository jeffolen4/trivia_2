class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.string :hint
      t.integer :sequence
      t.references :Question, index: true

      t.timestamps null: false
    end
    add_foreign_key :hints, :Questions
  end
end
