class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :url
      t.string :email
      t.string :phone
      t.string :location
      t.integer :price
      t.integer :founded
      t.integer :available # Percent of company available to be sold
      t.text :financials
      t.text :originality
      t.text :legal
      t.text :about
      t.integer :user_base
      t.text :growth
      t.integer :opportunity
      t.timestamps
    end
  end
end
