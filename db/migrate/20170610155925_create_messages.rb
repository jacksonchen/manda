class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.belongs_to :conversation, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
