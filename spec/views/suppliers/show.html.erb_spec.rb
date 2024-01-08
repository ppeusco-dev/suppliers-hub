require 'rails_helper'

RSpec.describe "suppliers/show", type: :view do
  before(:each) do
    assign(:supplier, Supplier.create!(
      name: "Name",
      nit: "Nit",
      contact_person_name: "Contact Person Name",
      contact_person_phone: "Contact Person Phone",
      bank: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Nit/)
    expect(rendered).to match(/Contact Person Name/)
    expect(rendered).to match(/Contact Person Phone/)
    expect(rendered).to match(//)
  end
end
