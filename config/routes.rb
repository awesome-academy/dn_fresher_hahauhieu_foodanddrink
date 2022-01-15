Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/logout", to: "sessions#destroy"
    resources :users, only: :show
    resources :products, only: %i(index show)
    resources :carts
    namespace :admin do
      root "static_pages#home"
    end
  end
end
