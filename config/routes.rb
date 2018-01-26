Rails.application.routes.draw do

  root to: "welcome#show"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :events
  resources :organizations, only: [:index, :show, :edit, :update, :destroy] do
    resources :contacts, only: [:new, :create, :edit, :update, :destroy]
  end
  get '/contacts' => 'contacts#index'

end
