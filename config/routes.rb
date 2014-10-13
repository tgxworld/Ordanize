Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#homepage'
  get '/pricing', to: 'static_pages#pricing'

  resources :users do
    member do
      get 'dashboard'
    end

    resources :products, except: [:index]
  end
end
