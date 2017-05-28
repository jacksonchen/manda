class AddAttachmentLogoFundingReportUserbaseAnalyticsLlcTaxEquityDivisionToCompanies < ActiveRecord::Migration
  def self.up
    change_table :companies do |t|
      t.attachment :logo
      t.attachment :funding_report
      t.attachment :userbase_analytics
      t.attachment :llc
      t.attachment :tax
      t.attachment :equity_division
    end
  end

  def self.down
    remove_attachment :companies, :logo
    remove_attachment :companies, :funding_report
    remove_attachment :companies, :userbase_analytics
    remove_attachment :companies, :llc
    remove_attachment :companies, :tax
    remove_attachment :companies, :equity_division
  end
end
