class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :portions
      t.text :description

      t.timestamps
    end
  end
end
