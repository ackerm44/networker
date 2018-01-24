Rails.application.routes.draw do

  root to: "users#show"
  devise_for :users
  resources :events

  resources :organizations do
    resources :contacts, only: [:edit, :update, :new, :create, :destroy]
  end
  get '/contacts' => 'contacts#index'

end
