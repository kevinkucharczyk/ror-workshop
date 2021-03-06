Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  match 'users/:id' => 'users#show', via: :get, as: 'user'

  root 'categories#index'
end
