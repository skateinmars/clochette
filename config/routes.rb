Clochette::Application.routes.draw do
  root 'home#index'

  post 'hooks/:service_name' => 'payloads#create'
end
