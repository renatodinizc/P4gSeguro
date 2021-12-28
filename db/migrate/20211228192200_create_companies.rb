class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cnpj
      t.string :billing_adress
      t.string :billing_email

      t.timestamps
    end
  end
end
