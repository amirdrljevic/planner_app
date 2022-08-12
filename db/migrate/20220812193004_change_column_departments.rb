class ChangeColumnDepartments < ActiveRecord::Migration[7.0]
  def change
    change_column_null :departments, :department_name, false
  end
end
