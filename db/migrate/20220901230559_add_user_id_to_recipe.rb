class AddUserIdToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :recipes, :user
  end
end
