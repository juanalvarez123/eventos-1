Rails.application.routes.draw do
  resources :events

  root 'events#index'

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  get     '/logout',  to: 'sessions#delete'
  delete  '/logout',  to: 'sessions#destroy'

  get     '/signin',  to: 'signins#new'
  post    '/signin',  to: 'signins#create'
end
