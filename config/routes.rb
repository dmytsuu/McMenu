Rails.application.routes.draw do
  root 'application#index'
  namespace :api do
    get 'products/index'
    post 'buckets/create'
    post 'sessions/create'
    post 'users/create'
    get 'sessions/:id', to: 'sessions#show'
  end

  get '/*path', to: 'application#index', format: false
end
