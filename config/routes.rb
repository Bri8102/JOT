Rails.application.routes.draw do

  root 'lists#index'

  resources :lists do
    resources :tasks do
      member do
        patch :complete
      end
    end
  end

  # resources :users do 
  #   resources :lists
  # end

  # resources :lists, only: [:create, :destroy] do
  #   resources :tasks, except: [:new, :edit, :show]
  # end



  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
