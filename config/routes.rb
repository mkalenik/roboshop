Rails.application.routes.draw do
  namespace :admin do
    root to: 'products#index'
    resources :categories
    resources :products
  end

  get 'regulamin', to: "static#terms", as: :terms
  get 'polityka-prywatnosci', to: "static#privacy", as: :privacy
  get 'dostawa', to: "static#shipping", as: :shipping
  get 'o-sklepie', to: "static#about", as: :about
 
  root to: "products#index"
  resources :categories, only: [:show], path: "kategoria"
  resources :products, only: [:index, :show], path: "produkt"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
