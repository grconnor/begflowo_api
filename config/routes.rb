Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', skip: [:omniauth_callbacks]
  namespace :api do
    namespace :v0 do
      resources :pings, onle: [:index], constraints: { format: 'json' }
    end
  end
end
