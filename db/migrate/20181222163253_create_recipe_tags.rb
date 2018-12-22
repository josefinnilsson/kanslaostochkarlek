class CreateRecipeTags < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_tags do |t|
      t.integer :recipe_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
