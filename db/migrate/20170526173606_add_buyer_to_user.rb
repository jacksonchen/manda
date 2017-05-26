class AddBuyerToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :buyer, :boolean
  end
end
