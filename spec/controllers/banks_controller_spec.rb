# spec/controllers/banks_controller_spec.rb
require 'rails_helper'

RSpec.describe BanksController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @banks' do
      bank = create(:bank)
      get :index
      expect(assigns(:banks)).to eq([bank])
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      bank = create(:bank)
      get :show, params: { id: bank.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new bank' do
      get :new
      expect(assigns(:bank)).to be_a_new(Bank)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new bank' do
        expect {
          post :create, params: { bank: attributes_for(:bank) }
        }.to change(Bank, :count).by(1)
      end

      it 'redirects to the created bank' do
        post :create, params: { bank: attributes_for(:bank) }
        expect(response).to redirect_to(Bank.last)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new bank' do
        expect {
          post :create, params: { bank: attributes_for(:bank, name: nil) }
        }.to_not change(Bank, :count)
      end

      it 're-renders the new template' do
        post :create, params: { bank: attributes_for(:bank, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'renders the edit template' do
      bank = create(:bank)
      get :edit, params: { id: bank.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:bank) { create(:bank) }

    context 'with valid attributes' do
      it 'updates the bank' do
        patch :update, params: { id: bank.id, bank: { name: 'New Name' } }
        bank.reload
        expect(bank.name).to eq('New Name')
      end

      it 'redirects to the updated bank' do
        patch :update, params: { id: bank.id, bank: { name: 'New Name' } }
        expect(response).to redirect_to(bank)
      end
    end

    context 'with invalid attributes' do
      it 'does not update the bank' do
        patch :update, params: { id: bank.id, bank: { name: nil } }
        bank.reload
        expect(bank.name).not_to be_nil
      end

      it 're-renders the edit template' do
        patch :update, params: { id: bank.id, bank: { name: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:bank) { create(:bank) }

    it 'destroys the bank' do
      expect {
        delete :destroy, params: { id: bank.id }
      }.to change(Bank, :count).by(-1)
    end

    it 'redirects to banks#index' do
      delete :destroy, params: { id: bank.id }
      expect(response).to redirect_to(banks_url)
    end
  end
end
