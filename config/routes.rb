Rails.application.routes.draw do
  root :to => "nonprofits#index"
  resources :events
  resources :nonprofits
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
