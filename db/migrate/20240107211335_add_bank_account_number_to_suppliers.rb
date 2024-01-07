class AddBankAccountNumberToSuppliers < ActiveRecord::Migration[7.1]
  def change
    add_column :suppliers, :bank_account_number, :string, limit: 15
  end
end
