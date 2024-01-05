# spec/models/bank_spec.rb

RSpec.describe Bank, type: :model do
  it "es válido con un nombre de banco válido" do
    bank = Bank.new(name: "Banco Ejemplo")
    expect(bank).to be_valid
  end

  it "no es válido sin un nombre de banco" do
    bank = Bank.new(name: nil)
    expect(bank).not_to be_valid
  end

  it "no es válido con un nombre de banco demasiado largo" do
    bank = Bank.new(name: "Banco con un nombre extremadamente largo que supera los 50 caracteres permitidos")
    expect(bank).not_to be_valid
  end
end
