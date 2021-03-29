Rails.application.routes.draw do
  # Google OAuth login
  get 'login', to: redirect('/auth/google'), as: 'login'
  get 'auth/google/callback' => 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resource :profile, except: :destroy
end
