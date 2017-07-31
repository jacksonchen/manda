class AddApprovalToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :approval, :integer
  end
end
