Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :courses, only: [ :index, :show ] do
    resources :bookings, only: [ :create]
  end

  get "my-bookings", to: "bookings#my_bookings", as: :my_bookings
  get "my-courses", to: "courses#my_courses", as: :my_courses

end
