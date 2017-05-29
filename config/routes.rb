Rails.application.routes.draw do
  # get 'profile/dreams'
  # get 'profile/show'
  # get 'profile/edit'
  # get 'profile/update'

  resource :profile, only: [:show, :edit, :update] do
    member do
      get '/dreams', to: 'profiles#dreams'
    end
  end

  resources :dreams

  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'pages#home'
end
