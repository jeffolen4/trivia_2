class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.boolean :active
      t.references :Category, index: true

      t.timestamps null: false
    end
    add_foreign_key :questions, :Categories
  end
end
