class CreateCompanyCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :company_categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :companies_company_categories, id: false do |t|
      t.belongs_to :company, index: true
      t.belongs_to :company_category, index: true
    end
  end
end
