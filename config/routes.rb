Rails.application.routes.draw do
  devise_for :users
  root to: "users#show"

  resources :events

  resources :organizations do
    resources :contacts
  end
end
