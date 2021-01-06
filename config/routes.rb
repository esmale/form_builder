Rails.application.routes.draw do

  namespace :admin do
    resources :forms do
      resources :responses, only: [:index, :show]
    end
    resources :questions
  end

  resources :forms, only: [] do
    resources :user_forms, only: [:new, :create]
  end

  devise_for :users
  root to: "admin/forms#index"
end
