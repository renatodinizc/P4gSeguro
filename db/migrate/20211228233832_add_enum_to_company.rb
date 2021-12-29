class AddEnumToCompany < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :status, :integer, default: 0
  end
end
