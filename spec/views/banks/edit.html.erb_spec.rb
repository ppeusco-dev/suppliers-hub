# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'banks/edit', type: :view do
  let(:bank) do
    Bank.create!(
      name: 'MyString'
    )
  end

  before(:each) do
    assign(:bank, bank)
  end

  it 'renders the edit bank form' do
    render

    assert_select 'form[action=?][method=?]', bank_path(bank, locale: I18n.locale), 'post' do
      assert_select 'input[name=?]', 'bank[name]'
    end
  end
end
