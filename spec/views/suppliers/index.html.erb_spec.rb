require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!(
        name: "Name",
        nit: "Nit",
        contact_person_name: "Contact Person Name",
        contact_person_phone: "Contact Person Phone",
        bank: nil
      ),
      Supplier.create!(
        name: "Name",
        nit: "Nit",
        contact_person_name: "Contact Person Name",
        contact_person_phone: "Contact Person Phone",
        bank: nil
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Nit".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Contact Person Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Contact Person Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
