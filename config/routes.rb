Rails.application.routes.draw do
  get 'welcome/index'

  resources :events

  root 'welcome#index'
end
