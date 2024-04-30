class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.boolean :is_op, default: false
      t.references :board_thread, null: false, foreign_key: true, index: true
      t.text :content
      t.integer :post_rating, default: 0
      t.references :user, null: true, foreign_key: true
      t.bigint :p_id

      t.timestamps
    end
  end
end
