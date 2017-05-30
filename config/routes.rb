Rails.application.routes.draw do
  resource :profile, only: [:show, :edit, :update] do
    member do
      get '/dreams', to: 'profiles#dreams'
    end
  end

  resources :dreams do
    resources :kitties, only: [:show, :new, :create, :edit, :update]
  end

  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'pages#home'
end
