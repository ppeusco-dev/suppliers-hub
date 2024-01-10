require 'rails_helper'

RSpec.describe SuppliersHelper, type: :helper do
  describe '#display_info' do
    it 'returns the value if attribute is in the whitelist and value is present' do
      expect(helper.display_info(:nit, '123')).to eq('123')
    end

    it 'returns "Sin información en la tabla" if attribute is not in the whitelist' do
      expect(helper.display_info(:invalid_attribute, '123')).to eq('Sin información en la tabla')
    end

    it 'returns "Sin información en la tabla" if value is not present' do
      expect(helper.display_info(:nit, nil)).to eq('Sin información en la tabla')
    end
  end
end
