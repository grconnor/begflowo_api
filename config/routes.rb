Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :pings, onle: [:index], constraints: { format: 'json' }
    end
  end
end
