Rails.application.routes.draw do
  resources :reservation_weeks do
    resources :reservations
  end
  root "welcome#index"

  devise_for :users

  get "about", to: "about#index"
  get "membership", to: "static#membership"
  get "guest_faq", to: "static#guest_faq"
  get "payment", to: "static#payment"
  get "volleyball", to: "static#volleyball"
  get "at_week", to: "static#at_week"

  namespace :admin do
    root "dashboard#index"
    resources :users

    # Master Bunk List Management
    resources :master_bunk_list, only: [ :index ] do
      collection do
        post :import_from_html
        patch :bulk_update
      end
      member do
        get :edit_bunk
        patch :update_bunk
      end
    end

    # Bunk Lists Management
    resources :bunk_lists, only: [ :index, :show, :edit, :update, :destroy ] do
      member do
        post :generate
        get :print
        post :finalize_and_email
        post :add_guest
      end
    end
  end

  # Profile routes - only show and edit, users can only edit their own profile
  resource :profile, only: [ :show, :edit, :update ]

  # These routes are for the old blog and portfolio sections, which are no longer part of this application.
  # They are commented out to avoid conflicts and keep the routing table clean.
  #
  # resources :posts do
  #   resources :comments, only: [ :create, :destroy ]
  # end
  #
  # resources :projects

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "membership", to: "static#membership"
  get "guest_faq", to: "static#guest_faq"

  # Defines the root path for authenticated users.
  # After a user logs in, they will be redirected to the weekly reservation view.
  authenticated :user do
    root "reservation_weeks#index", as: :authenticated_root
  end

  # Member-facing reservation system routes, prefixed with /app.
  scope "/app", as: "app" do
    # If a date is provided (e.g., /app/week/2024-12-26), show that week.
    # Otherwise (e.g., /app/week), show the current week.
    get "week(/:date)", to: "reservation_weeks#show", as: "reservation_week"

    # Routes for creating, viewing, editing, and deleting reservations.
    # The main list of reservations is on the weekly view, so we exclude :index.
    resources :reservations, except: [ :index ]

    # Admin-only routes for creating, editing, and deleting notes for a week.
    # A note is always associated with a ReservationWeek.
    resources :notes, except: [ :index, :show ]
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # API routes
  namespace :api do
    get "members", to: "members#index"
  end

  # Defines the root path route ("/")
end
