Rails.application.routes.draw do

  root to: "users#show"
  devise_for :users
  resources :events
  resources :organizations, only: [:index, :show, :edit, :update, :destroy] do
    resources :contacts, only: [:new, :create, :edit, :update, :destroy]
  end
  get '/contacts' => 'contacts#index'

end
