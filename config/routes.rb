Clochette::Application.routes.draw do
  root 'home#index'

  resources :user_sessions, only: [:create]
  get 'login' => 'user_sessions#new', as: :login
  delete 'logout' => 'user_sessions#destroy', as: :logout

  resources :users, except: [:show]

  resources :projects, only: [:index, :new, :create, :destroy] do
    resources :triggers, only: [:index, :create, :destroy]
  end

  post 'hooks/:project_id/:service_name' => 'payloads#create', as: :hook
end
