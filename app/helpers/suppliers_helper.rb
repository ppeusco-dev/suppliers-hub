module SuppliersHelper
  def bank_name_for_supplier(supplier)
    supplier&.bank&.name
  end
end
