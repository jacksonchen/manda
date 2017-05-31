class AddAttachmentFinancesToCompanies < ActiveRecord::Migration
  def self.up
    change_table :companies do |t|
      t.attachment :finances
    end
  end

  def self.down
    remove_attachment :companies, :finances
  end
end
