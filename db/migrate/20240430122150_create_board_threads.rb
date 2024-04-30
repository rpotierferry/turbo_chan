class CreateBoardThreads < ActiveRecord::Migration[7.1]
  def change
    create_table :board_threads do |t|
      t.references :board, null: false, foreign_key: true, index: true
      t.references :user, null: true, foreign_key: true
      t.bigint :bt_id

      t.timestamps
    end
  end
end
