module SuppliersHelper
  ATTRIBUTE_LIST = %i[nit contact_person_phone bank_account_number].freeze

  def display_info(attribute, value)
    return value if valid_attribute?(attribute, value)

    'Sin información en la tabla'
  end

  def bank_name_for_supplier(supplier)
    supplier&.bank&.name
  end

  private

  def valid_attribute?(attribute, value)
    ATTRIBUTE_LIST.include?(attribute) && value.present?
  end
end
