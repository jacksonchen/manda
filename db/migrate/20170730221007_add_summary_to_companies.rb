class AddSummaryToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :summary, :string
  end
end
