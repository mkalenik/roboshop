Rails.application.routes.draw do
  get 'static/terms'
  get 'static/privacy'
  get 'static/shipping'
  get 'static/about'
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
