Rails.application.routes.draw do
  resources :albums, only: [:new, :show, :create]
  get '/albums/:id/update_photos', to: 'albums#update_photos', as: 'update_photos'
  post '/albums/:id/update_photos', to: 'albums#save_photos'
  
  resources :photos, only: [:new, :show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
