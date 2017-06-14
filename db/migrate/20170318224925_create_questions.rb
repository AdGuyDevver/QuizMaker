class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :number
      t.text :question_text
      t.string :question_type
      t.text :answer

      t.timestamps null: false
    end
  end
end
