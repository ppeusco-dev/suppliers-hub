class DashboardController < ApplicationController
  def show
    @total_banks = Bank.count
    @total_suppliers = Supplier.count
  end
end
