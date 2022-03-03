Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items, only: %i[index update]
      post '/items/check_price', to: 'items#check_price'
      post '/items/apply_discount', to: 'items#apply_discount'
    end
  end
end
