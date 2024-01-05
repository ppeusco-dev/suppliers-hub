Rails.application.routes.draw do
  resources :banks

  root "banks#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
