class AddSummaryToBuyers < ActiveRecord::Migration[5.0]
  def change
    add_column :buyers, :summary, :string
  end
end
