Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'calendar#index'

  resources :calendar, only: :index do
    get 'load', on: :collection
  end
end
