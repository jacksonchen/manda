class ChangeUserIdForBuyerAndSeller < ActiveRecord::Migration[5.0]
  def change
    remove_reference :buyers, :users, index: true, foreign_key: true
    remove_reference :sellers, :users, index: true, foreign_key: true
    add_reference :buyers, :user, index: { unique: true }, foreign_key: true
    add_reference :sellers, :user, index: { unique: true }, foreign_key: true
  end
end
