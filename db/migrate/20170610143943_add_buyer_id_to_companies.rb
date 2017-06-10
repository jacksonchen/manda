class AddBuyerIdToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_reference :companies, :buyer, index: true
    rename_column :buyers, :company, :business
    rename_column :buyers, :company_role, :business_role
  end
end
