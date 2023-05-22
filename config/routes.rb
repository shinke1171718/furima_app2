Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :item do
    member do
      get :checkout
    end
  end
end