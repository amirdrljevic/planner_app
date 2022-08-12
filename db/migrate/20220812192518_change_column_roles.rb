class ChangeColumnRoles < ActiveRecord::Migration[7.0]
  def change
    change_column_null :roles, :role_name, false
  end
end
