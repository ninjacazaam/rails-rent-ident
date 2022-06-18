class CreateLives < ActiveRecord::Migration[6.1]
  def change
    create_table :lives do |t|
      t.string :title
      t.text :bio
      t.integer :rating
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
