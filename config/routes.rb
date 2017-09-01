Rails.application.routes.draw do
  resources :albums, only: [:new, :show, :create]
  resources :photos, only: [:new, :show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
