class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.integer :status
      t.belongs_to :buyer, index: true
      t.belongs_to :company, index: true
      t.float :price
      t.timestamps
    end
  end
end
