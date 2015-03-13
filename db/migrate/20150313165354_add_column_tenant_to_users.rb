class AddColumnTenantToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tenant, :string
  end
end
