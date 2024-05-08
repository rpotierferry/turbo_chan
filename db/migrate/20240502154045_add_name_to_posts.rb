class AddNameToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :name, :string
  end
end
