# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'banks/index', type: :view do
  before(:each) do
    assign(:banks, [
             Bank.create!(
               name: 'Name'
             ),
             Bank.create!(
               name: 'Name'
             )
           ])
  end

  it 'renders a list of banks' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end
