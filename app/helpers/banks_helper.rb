# frozen_string_literal: true

module BanksHelper
  def bank_form_url_and_method(bank)
    if bank.persisted?
      { url: bank_path(bank, locale: I18n.locale), method: :patch }
    else
      { url: banks_path(locale: I18n.locale), method: :post }
    end
  end
end
