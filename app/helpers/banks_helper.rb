# frozen_string_literal: true

module BanksHelper
  def banks_for_select
    Bank.all
  end
end
