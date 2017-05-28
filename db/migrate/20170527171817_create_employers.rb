class CreateEmployers < ActiveRecord::Migration[5.0]
  def change
    create_table :employers do |t|
      t.references :employable, polymorphic: true, index: true
      t.string :name
      t.string :role
      t.timestamps
    end
  end
end
