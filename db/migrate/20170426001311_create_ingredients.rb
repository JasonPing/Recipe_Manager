class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description
      t.integer :recipe_id

      t.timestamps
    end
  end
end
