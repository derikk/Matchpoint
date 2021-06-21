class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :grade
      t.integer :gender
      t.boolean :likes_women, null: false, default: false
      t.boolean :likes_men, null: false, default: false
      t.boolean :likes_nonbinary, null: false, default: false
      t.text :bio
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
