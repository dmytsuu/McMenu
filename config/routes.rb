Rails.application.routes.draw do
  post 'buckets/create'
  get 'products/index'
  root 'application#index'
end
