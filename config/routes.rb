Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :courses, only: [ :index, :show, :new, :create ] do
    resources :bookings, only: [ :create ]
    resources :reviews, only: [ :create ]

  end

  get "my-bookings", to: "bookings#my_bookings", as: :my_bookings
  get "my-courses", to: "courses#my_courses", as: :my_courses

  get "my-jobs", to: "courses#my_jobs", as: :my_jobs
  get "tagged", to: "courses#tagged", as: :tagged


end
