Rails.application.routes.draw do
  devise_for :users
  root to: "pages#landing"

  resources :users, only: [] do
    resources :companies, only: [:new, :create]
    collection do
      get :dashboard
      get :edit_profile
      patch :update_profile
      get :update_profile
      get :my_experiences
      get :my_bookings
      get :invite_friends
    end
  end

  resources :experiences do
    resources :events, only: [] do
      resources :bookings, shallow: true, except: :index
    end

    collection do
      get :guidelines
    end
  end

  resources :bookings, only: :index
end
