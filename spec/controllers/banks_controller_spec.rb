# spec/controllers/banks_controller_spec.rb

require 'rails_helper'

RSpec.describe BanksController, type: :controller do
  let(:valid_attributes) {
    # Define valid attributes for your Bank resource here
    { name: 'Example Bank' }
  }

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      bank = Bank.create! valid_attributes
      get :show, params: { id: bank.to_param }
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      bank = Bank.create! valid_attributes
      get :edit, params: { id: bank.to_param }
      expect(response).to render_template("edit")
    end
  end
end
