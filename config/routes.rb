Rails.application.routes.draw do
  devise_for :users
  root to: "users#show"

  resources :events

  resources :organizations do
    resources :contacts, only: [:edit, :update, :new, :create, :destroy]
  end

  get '/contacts' => 'contacts#index'

end
