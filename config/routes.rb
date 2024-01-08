# frozen_string_literal: true

Rails.application.routes.draw do
  
  devise_for :users
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    resources :banks
    resources :suppliers
    root 'suppliers#index'
    get '/dashboard', to: 'dashboard#show'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
