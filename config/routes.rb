Rails.application.routes.draw do
  root 'home#index'

  get 'home/prices' => 'home#prices', as: :prices

  post 'home/prices' => 'home#prices'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
