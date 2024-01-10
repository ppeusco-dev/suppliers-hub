require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#form_url_and_method' do
    it 'devuelve la URL y el método correctos para un objeto persistido' do
      object = FactoryBot.create(:bank)

      expect(helper.form_url_and_method(object)).to eq({ url: send("#{object.class.to_s.downcase}_path", object, locale: I18n.locale), method: :patch })
    end

    it 'devuelve la URL y el método correctos para un objeto no persistido' do
      object = Supplier.new

      expect(helper.form_url_and_method(object)).to eq({ url: send("#{object.class.to_s.downcase.pluralize}_path", locale: I18n.locale), method: :post })
    end
  end
end
