Rails.application.routes.draw do
  root to: 'items#index'
  get 'items/:id/cheackout', to: 'items#cheackout', as: 'item_cheackout'
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :items do
    member do
      get :cheackout
    end
  end
end