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

    post 'events/create_recurring_event', to: 'events#create_recurring_event'
    put 'events/update_all_event_occurances', to: 'events#update_all_event_occurances'
    put 'events/update_future_event_occurances', to: 'events#update_future_event_occurances'
    delete 'events/destroy_all_event_occurances', to: 'events#destroy_all_event_occurances'
    delete 'events/destroy_future_event_occurances', to: 'events#destroy_future_event_occurances'

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

  resources :recurring_groups
  resources :guardian_profiles
  resources :teacher_profiles
  resources :preferences, only: :update
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
