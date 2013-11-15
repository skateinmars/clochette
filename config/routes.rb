Clochette::Application.routes.draw do
  root 'home#index'

  post 'github' => 'github#hook'
end
