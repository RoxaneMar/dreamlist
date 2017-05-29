Rails.application.routes.draw do
  get 'users/show'

  get 'users/profile_edit'

  get 'users/profile_update'

  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  resources :dreams
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
