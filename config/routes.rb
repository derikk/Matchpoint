Rails.application.routes.draw do
  # Google OAuth login
  get 'login', to: redirect('/auth/google'), as: :login
  get 'auth/google/callback' => 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout

  # User routes
  resource :profile, except: :destroy
  get 'survey', to: 'surveys#active', as: :active_survey

  # Admin routes
  scope 'admin' do
    resources :surveys do
      member do
        post 'active', to: 'surveys#set_active', as: :set_active
      end
    end
  end
end
