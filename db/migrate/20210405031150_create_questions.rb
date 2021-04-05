class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :question
      t.text :answers
      t.belongs_to :survey, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
