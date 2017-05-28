class ChangeForeignKeyForBuyersAndSellers < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :buyers, :users
    remove_foreign_key :sellers, :users

    add_foreign_key :buyers, :users, on_delete: :cascade
    add_foreign_key :sellers, :users, on_delete: :cascade
  end
end
