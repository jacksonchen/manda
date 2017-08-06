class AddApprovalToBuyers < ActiveRecord::Migration[5.0]
  def change
    add_column :buyers, :approval, :integer
  end
end
