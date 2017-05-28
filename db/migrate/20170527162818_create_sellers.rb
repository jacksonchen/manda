class CreateSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :sellers do |t|
      t.belongs_to :users, index: { unique: true }, foreign_key: true
      t.belongs_to :company
      t.string :company_role
      t.string :name
      t.integer :age
      t.string :corporate_email
      t.string :phone
      t.text :address
      t.integer :gender
      t.integer :education
      t.string :education_institution
      t.string :expertise, array: true, default: []
      t.string :linkedin
      t.integer :equity
      t.string :ssn
      t.text :about
      t.timestamps
    end
  end
end
