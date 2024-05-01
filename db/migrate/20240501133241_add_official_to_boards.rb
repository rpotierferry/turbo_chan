class AddOfficialToBoards < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :official, :boolean, default: false
  end
end
