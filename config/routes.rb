Rails.application.routes.draw do
 
  
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'sign_up'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }, 
    defaults: { format: :json }
    get '/me', to: 'users#show'

    resources :users, only: [:index, :update, :destroy]
    resources :studios, except: :destroy
    resources :events
    resources :families
    resources :students do
      collection do
        put :bulk_update
        delete :bulk_destroy
      end
    end

    resources :preferences, only: :update
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
