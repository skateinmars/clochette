Clochette::Application.routes.draw do
  root 'home#index'

  post 'hooks/:project_id/:service_name' => 'payloads#create'
end
