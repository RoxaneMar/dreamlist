Rails.application.routes.draw do

  resources :profiles, only: [:show, :edit, :update] do
    member do
      get '/dreams', to: 'profiles#dreams'
    end
  end

  resources :dreams do
    resources :kitties, only: [:show, :new, :create]
    resource :like, only: [:create, :destroy]
  end

  resources :kitties, only: [] do
    resources :contributors, only: [:new, :create]
  end

  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: :registrations }

  root to: 'pages#home'
end
