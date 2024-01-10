require 'rails_helper'

RSpec.describe BanksHelper, type: :helper do
  describe '#banks_for_select' do
    it 'returns all banks' do
      bank1 = create(:bank, name: 'Bank 1')
      bank2 = create(:bank, name: 'Bank 2')

      expect(banks_for_select).to match_array([bank1, bank2])
    end
  end
end
