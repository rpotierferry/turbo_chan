class AddTypeAndParentPostIdToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :type, :string
    add_column :posts, :parent_post_id, :bigint
    add_index :posts, :parent_post_id
  end
end
