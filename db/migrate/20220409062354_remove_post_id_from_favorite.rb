class RemovePostIdFromFavorite < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :post_id, :integer
  end
end
