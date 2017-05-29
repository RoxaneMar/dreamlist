Rails.application.routes.draw do
  get 'users/show'
  get 'users/profile_edit'
  get 'users/profile_update'

  resources :dreams

  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'pages#home'
end
