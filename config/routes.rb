Rails.application.routes.draw do
  get 'users/show'

  resource :session
  resources :stories do
    collection do
      get "bin"
    end
    resources :votes
  end
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "stories#index"
end
