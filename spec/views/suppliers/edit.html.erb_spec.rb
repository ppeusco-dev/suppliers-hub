require 'rails_helper'

RSpec.describe "suppliers/edit", type: :view do
  let(:supplier) {
    Supplier.create!(
      name: "MyString",
      nit: "MyString",
      contact_person_name: "MyString",
      contact_person_phone: "MyString",
      bank: nil
    )
  }

  before(:each) do
    assign(:supplier, supplier)
  end

  it "renders the edit supplier form" do
    render

    assert_select "form[action=?][method=?]", supplier_path(supplier), "post" do

      assert_select "input[name=?]", "supplier[name]"

      assert_select "input[name=?]", "supplier[nit]"

      assert_select "input[name=?]", "supplier[contact_person_name]"

      assert_select "input[name=?]", "supplier[contact_person_phone]"

      assert_select "input[name=?]", "supplier[bank_id]"
    end
  end
end
