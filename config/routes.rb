Rails.application.routes.draw do

  resources :forms
  resources :questions
  
  devise_for :users
  root to: "forms#index"
end
