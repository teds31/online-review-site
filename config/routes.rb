Rails.application.routes.draw do
  root "products#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    resources :reviews
  end
  namespace :api do
    namespace :v1 do
      resources :votes
    end
  end
end
