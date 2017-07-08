class AddRecipientToMessages < ActiveRecord::Migration[5.0]
  def up
    change_table :messages do |t|
      t.references :recipient, :polymorphic => true
    end
  end

  def down
    change_table :messages do |t|
      t.remove_references :recipient, :polymorphic => true
    end
  end
end
