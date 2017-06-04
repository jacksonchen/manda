class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.string :email
      t.string :token
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :company_id
      t.boolean :accepted, :default => false
      t.timestamps
    end
  end
end
