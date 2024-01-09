class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @total_banks = Bank.count
    @total_suppliers = Supplier.count
  end
end
