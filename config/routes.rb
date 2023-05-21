Rails.application.routes.draw do
  devise_for :users

  resources :item do
    member do
      get :checkout
    end
  end
end
