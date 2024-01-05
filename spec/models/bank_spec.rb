# spec/models/bank_spec.rb

require 'rails_helper'

RSpec.describe Bank, type: :model do
  it "is valid with a valid bank name" do
    bank = Bank.new(name: "Banco Ejemplo")
    expect(bank).to be_valid
  end

  it "not valid without a bank name" do
    bank = Bank.new(name: nil)
    expect(bank).not_to be_valid
  end

  it "not valid with a bank name that is too long" do
    bank = Bank.new(name: "Bank with an extremely long bank name that exceeds the allowed 50 characters")
    expect(bank).not_to be_valid
  end
end
