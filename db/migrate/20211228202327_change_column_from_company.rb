class ChangeColumnFromCompany < ActiveRecord::Migration[6.1]
  def change
    rename_column :companies, :billing_adress, :billing_address
  end
end
