Rails.application.routes.draw do

    root 'activities#index'

    #Activities routes
    resources :activities, only:[:index,:new,:create] do
        resources :logs, only:[:index, :new,:create]
    end
    #get 'activities/new'
    #post 'activities', to: 'activities#create'

    #Logs routes
    #get 'activities/:activity_id/logs/new', to: 'logs#new'
    #post 'activities/:activity_id/logs', to: 'logs#create'


    devise_for :users
    get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
