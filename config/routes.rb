Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'links#new'
  get '/:slug', to: 'links#show'
  resources :links, only: [:show, :new, :create]
end
