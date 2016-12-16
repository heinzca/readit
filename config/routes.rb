Rails.application.routes.draw do
  resources :stories do
    resources :votes do
    end
  # : routes
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # get 'votes/create'
    #
    # resources :stories
    # get 'stories/index'
    # get 'stories/new'

end
