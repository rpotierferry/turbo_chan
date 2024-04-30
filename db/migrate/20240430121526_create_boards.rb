class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :handle
      t.string :category
      t.text :description
      t.boolean :private, default: false
      t.references :user, null: false, foreign_key: true
      t.bigint :b_id

      t.timestamps
    end
  end
end
