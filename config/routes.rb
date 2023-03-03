Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/customer', to: 'customers#show'
      post '/customer-subscriptions', to: 'customer_subscriptions#create'
    end
  end
end
