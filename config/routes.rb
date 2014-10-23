Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#homepage'
  get '/pricing', to: 'static_pages#pricing'

  scope :sg do
    get '/guoxiang/:id', to: 'products#show', as: '/product'
  end

  resources :users do
    member do
      get 'dashboard'
    end

    resources :products, except: [:index, :show]
  end
end
