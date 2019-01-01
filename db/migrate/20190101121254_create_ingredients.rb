class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :amount
      t.string :measure

      t.timestamps
    end
  end
end
