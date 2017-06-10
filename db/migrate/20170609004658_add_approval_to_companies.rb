class AddApprovalToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :approval, :integer
  end
end
