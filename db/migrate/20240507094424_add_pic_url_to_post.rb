class AddPicUrlToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :photo_url, :string
  end
end
