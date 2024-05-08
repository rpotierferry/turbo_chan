class RenamePostRating < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :post_rating, :rating
  end
end
