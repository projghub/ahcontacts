require 'domain_constraints'

Ahcontacts::Application.routes.draw do

  constraints(ApplicationDomain.new) do
    match '/admin' => 'admin/admin#index'
    namespace :admin do
      match '/dashboard' => 'admin#dashboard'
      match '/login' => 'sessions#new'
      match '/logout' => 'sessions#destroy'
    end

    match '/advertiser' => 'advertiser/advertiser#index'
    namespace :advertiser do
      match '/dashboard' => 'advertiser#dashboard'
      match '/login' => 'sessions#new'
      match '/logout' => 'sessions#destroy'
    end
  end

  root :to => 'errors#not_sure'
end
