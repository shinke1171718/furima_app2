Rails.application.routes.draw do
  devise_scope :user do
    get 'users/sign_in', to: 'sessions#new', as: :new_user_session
    post 'users/sign_in', to: 'sessions#create', as: :user_session
    get 'users/sign_out', to: 'sessions#destroy', as: :destroy_user_session
    get 'users/sign_up', to: 'registrations#new', as: :new_user_registration
    post 'users/sign_up', to: 'registrations#create', as: :user_registration
  end
  root to: 'items#index'
  get 'items/:id/cheackout', to: 'items#cheackout', as: 'item_cheackout'
  resources :items do
    member do
      get :checkout
    end
  end
end
