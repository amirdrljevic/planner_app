class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :street_address
      t.integer :postal_code
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
