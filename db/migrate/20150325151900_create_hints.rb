class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.string :hint
      t.integer :sequence
      t.references :question, index: true

      t.timestamps null: false
    end
    add_foreign_key :hints, :questions
  end
end
