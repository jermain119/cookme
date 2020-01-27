class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.string :ingredients
      t.string :instructions
      t.string :description
      t.timestamps
    end
  end
end
