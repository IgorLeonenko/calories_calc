Rails.application.routes.draw do
  root "home#index"
  resources :nutrients
  resources :weights, only: [:new, :create, :show]
  resources :products, except: [:show]
  post "add_product", to: "weights#add_product_to_ration"
  delete "remove_product", to: "weights#remove_product_from_ration"
end
