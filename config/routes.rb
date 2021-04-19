Rails.application.routes.draw do

  post 'login', to: 'login#login'

  namespace :api do
    namespace :v1 do
      resources :authentications
      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
