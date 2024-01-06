# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :banks

    root 'banks#index'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
