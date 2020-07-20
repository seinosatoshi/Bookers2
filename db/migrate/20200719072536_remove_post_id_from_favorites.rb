class RemovePostIdFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :post_id, :string
  end
end
