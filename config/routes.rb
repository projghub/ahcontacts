require 'domain_constraints'

Ahcontacts::Application.routes.draw do

  constraints(ApplicationDomain.new) do
    match '/admin' => 'admin/admin#index'
    namespace :admin do
      match '/dashboard' => 'admin#dashboard'
      match '/login' => 'sessions#new'
      match '/logout' => 'sessions#destroy'

      resources :contacts do
        post '/notes' => 'contacts#add_note'
      end
      resources :emails
      resources :users
      resources :sessions, only: [:create]
      resources :statuses
    end

    match '/advertiser' => 'advertiser/advertiser#index'
    namespace :advertiser do
      match '/dashboard' => 'advertiser#dashboard'
      match '/login' => 'sessions#new'
      match '/logout' => 'sessions#destroy'

      resources :contacts do
        post '/notes' => 'contacts#add_note'
      end
      resources :emails
      resources :sessions, only: [:create]
      resources :statuses
    end
  end

  root :to => 'errors#not_sure'
end
