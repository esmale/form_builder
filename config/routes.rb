Rails.application.routes.draw do

  namespace :admin do
    resources :forms
    resources :questions
  end

  devise_for :users
  root to: "admin/forms#index"
end
