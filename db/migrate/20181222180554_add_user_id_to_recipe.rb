class AddUserIdToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :user_id, :integer
  end
end
