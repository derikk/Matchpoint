class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :choice

      t.timestamps
    end
  end
end
