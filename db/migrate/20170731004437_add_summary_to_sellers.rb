class AddSummaryToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :summary, :string
  end
end
