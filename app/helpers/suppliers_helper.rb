module SuppliersHelper
  def supplier_form_url_and_method(supplier)
    if supplier.persisted?
      { url: supplier_path(supplier, locale: I18n.locale), method: :patch }
    else
      { url: suppliers_path(locale: I18n.locale), method: :post }
    end
  end
end
