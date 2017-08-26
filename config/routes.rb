# For details on the DSL available within this file
# http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  mount ActionCable.server => "/cable"

  # Authentication
  get "sign_in", to: "sessions#new", as: "sign_in"
  get "sign_up", to: "users#new", as: "sign_up"
  get "sign_out", to: "sessions#destroy", as: "sign_out"

  # constraints subdomain: "administration" do
  #   scope module: "administration" do
  #     match "organisation_sign_in/:id" => "organisation_sign_in#{create}",
  #           via: [:post],
  #           as: :administration_organisation_sign_in
  #     match "current_tenant/:id" => "current_tenant#create",
  #           via: [:post],
  #           as: :administration_current_tenant
  #   end
  # end

  resources :sessions, only: [:create, :delete]
  resources :users, only: [:create]
  resources :ideas

  root "users#new"
end
