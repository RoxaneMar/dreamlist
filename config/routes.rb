Rails.application.routes.draw do
  resource :profile, only: [:show, :edit, :update] do
    member do
      get '/dreams', to: 'profiles#dreams'
    end
  end

  resources :dreams do
    resources :kitties, only: [:show, :new, :create]
  end

  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: :registrations }

  root to: 'pages#home'
end
