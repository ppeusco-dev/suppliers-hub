# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'banks/new', type: :view do
  before(:each) do
    assign(:bank, Bank.new(
                    name: 'MyString'
                  ))
  end

  it 'renders new bank form' do
    render

    assert_select 'form[action=?][method=?]', banks_path(locale: I18n.locale), 'post' do
      assert_select 'input[name=?]', 'bank[name]'
    end
  end
end
