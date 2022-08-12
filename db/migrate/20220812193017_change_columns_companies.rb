class ChangeColumnsCompanies < ActiveRecord::Migration[7.0]
  def change
    change_column_null :companies, :company_name, false
    change_column_null :companies, :country, false
    change_column_null :companies, :city, false
  end
end
