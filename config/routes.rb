Rails.application.routes.draw do
  resources :posts do
    collection do
      get 'user_posts', to: 'posts#user_posts', as: :user
    end
  end

  get 'static_pages/home'

  devise_for :users

  root 'posts#index'
  resources :users, only: [:update, :index]

  resources :events
  resources :units

end
