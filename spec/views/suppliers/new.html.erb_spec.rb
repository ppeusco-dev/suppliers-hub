require 'rails_helper'

RSpec.describe "suppliers/new", type: :view do
  before(:each) do
    assign(:supplier, Supplier.new(
      name: "MyString",
      nit: "MyString",
      contact_person_name: "MyString",
      contact_person_phone: "MyString",
      bank: nil
    ))
  end

  it "renders new supplier form" do
    render

    assert_select "form[action=?][method=?]", suppliers_path, "post" do

      assert_select "input[name=?]", "supplier[name]"

      assert_select "input[name=?]", "supplier[nit]"

      assert_select "input[name=?]", "supplier[contact_person_name]"

      assert_select "input[name=?]", "supplier[contact_person_phone]"

      assert_select "input[name=?]", "supplier[bank_id]"
    end
  end
end
