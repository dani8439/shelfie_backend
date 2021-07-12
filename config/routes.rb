Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :books, only: [:index, :new, :create, :edit, :update, :destroy] do

        resources :quotes, only: [:index, :create]
      end
    end
  end

end
