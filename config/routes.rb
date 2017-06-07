Rails.application.routes.draw do

  resources :profiles, only: [:show, :edit, :update] do
    resource :relationship, only: [:create, :destroy]
    member do
      get '/dreams', to: 'profiles#dreams'
    end
  end

  resources :dreams do
    member do
      put '/realized', to: 'dreams#realized'
    end
    resources :kitties, only: [:show, :new, :create]
    resource :like, only: [:create, :destroy]
  end

  resources :kitties, only: [] do
    put '/reveal', to: 'kitties#reveal'
    resources :contributors, only: [:new, :create]
  end

  resources :contributors, only: [] do
    resources :payments, only: [:new, :create]
  end

  resources :notifications, only: [:show]

  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: :registrations }

  root to: 'pages#home'
end
