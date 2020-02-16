Rails.application.routes.draw do
  root 'products#index'
  post 'buckets/create'
  get 'products/index'




  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy

end
