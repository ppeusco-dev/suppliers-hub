# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/banks', type: :request do
  # let(:valid_attributes) { { name: "First Bank" } }
  let(:valid_attributes) { attributes_for(:bank, name: 'First Bank') }
  let(:invalid_attributes_with_null_name) { { name: '' } }
  let(:invalid_attributes_with_long_name) { { name: 'The best, biggest and most impressive bank worldwide' } }

  before { create(:bank, valid_attributes) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get banks_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get bank_url(Bank.last, locale: I18n.locale)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_bank_url(locale: I18n.locale)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_bank_url(Bank.last, locale: I18n.locale)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Bank' do
        expect do
          post banks_url(locale: I18n.locale), params: { bank: valid_attributes }
        end.to change(Bank, :count).by(1)
        expect(response).to redirect_to(bank_url(Bank.last, locale: I18n.locale))
      end
    end

    context 'with invalid parameters (null name)' do
      it 'does not create a new Bank and renders a response with 422 status' do
        expect do
          post banks_url(locale: I18n.locale), params: { bank: invalid_attributes_with_null_name }
        end.to change(Bank, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with invalid parameters (long name)' do
      it 'does not create a new Bank and renders a response with 422 status' do
        expect do
          post banks_url(locale: I18n.locale), params: { bank: invalid_attributes_with_long_name }
        end.to change(Bank, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { name: 'Last Bank' } }

      it 'updates the requested bank and redirects to the bank' do
        bank = Bank.last
        patch bank_url(bank, locale: I18n.locale), params: { bank: new_attributes }
        bank.reload
        expect(bank.name).to eq('Last Bank')
        expect(response).to redirect_to(bank_url(bank, locale: I18n.locale))
      end
    end

    context 'with invalid parameters (null name)' do
      it 'renders a response with 422 status' do
        bank = Bank.create! valid_attributes
        patch bank_url(bank, locale: I18n.locale), params: { bank: invalid_attributes_with_null_name }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'with invalid parameters (long name)' do
      it 'renders a response with 422 status' do
        bank = Bank.create! valid_attributes
        patch bank_url(bank, locale: I18n.locale), params: { bank: invalid_attributes_with_long_name }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested bank and redirects to the banks list' do
      expect do
        delete bank_url(Bank.last, locale: I18n.locale)
      end.to change(Bank, :count).by(-1)
      expect(response).to redirect_to(banks_url)
    end
  end
end
