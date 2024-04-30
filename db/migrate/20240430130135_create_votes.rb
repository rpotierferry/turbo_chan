class CreateVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :value, default: 1

      t.timestamps
    end

    add_index :votes, [:user_id, :post_id], unique: true

  end
end
