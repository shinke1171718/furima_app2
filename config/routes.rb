Rails.application.routes.draw do
  get 'mypages/show'
  devise_scope :user do
    get 'users/sign_in', to: 'sessions#new', as: :new_user_session
    post 'users/sign_in', to: 'sessions#create', as: :user_session
    get 'users/sign_out', to: 'sessions#destroy', as: :destroy_user_session
    get 'users/sign_up', to: 'registrations#new', as: :new_user_registration
    post 'users/sign_up', to: 'registrations#create', as: :user_registration
    get 'registrations/edit', to: 'registrations#edit', as: :edit_user_registration
    patch 'registrations/update', to: 'registrations#update', as: :update_user_registration
  end
  root to: 'items#index'
  get 'items/:id/cheackout', to: 'items#cheackout', as: 'item_cheackout'
  resources :items do
    resources :chats, only: [:create]
    member do
      get :checkout
    end
  end
  resources :messages
  resources :mypages do
    member do
      get :purchased_items
      get :listed_items
    end
  end

  get 'secondaddress/edit_or_new', to: 'secondaddresses#edit_or_new', as: 'edit_or_new_secondaddress'
  resources :secondaddresses
end
