Wh::Application.routes.draw do 

  # Main routes

  root :to => "public#index"
  match "/about" => "public#about"
  match "/contact" => "public#contact"

  # Carriage routes

  match "carriages" => "carriages#create", :as => "carriage", :via => :post
  match "carriages" => "carriages#index", :as => "carriage_index"
  match "carriages/new/:q" => "carriages#new", :as => "carriage_new"
  match "carriages/new" => "carriages#new", :as => "carriage_new"
  match "carriages/scan/:q" => "carriages#barcode", :as => "carriage_scan"
  match "carriages/scan" => "carriages#barcode", :as => "carriage_scan"
  match "carriages/view/:serial" => "carriages#view", :as => "carriage_show"
  match "carriages/edit/:serial" => "carriages#edit", :as => "carriage_edit"
  match "carriages/view/:warehouse_point" => "carriages#position", :as => "carriage_position"
  match "carriages/:serial" => "carriages#destroy", :as => "carriage_delete", :via => [:get, :delete]
  match "carriages/:serial" => "carriages#update", :as => "carriage_update", :via => :put

  # User routes

  match "users" => "users#index", :as => "user_index"
  match "login" => "users#login", :as => "login", :via => [:get, :post]
  match "register" => "users#register"
  match  "users/create", :as => "users", :via => [:post, :get]
  match "logout" => "users#destroy"

  #Surveyors routes, sub materials & orders routes

  match "surveyors" => "surveyors#index"

  namespace :surveyors do
    match "materials" => "materials#create", :as => "materials", :via => :post
    match "materials" => "materials#index"
    match "materials/new" => "materials#new" 
    match "materials/:id" => "materials#destroy", :as => "materials_delete", :via => [:get, :delete]
    match "materials/view/:id" => "materials#show", :as => "materials_show"
    match "materials/:id" => "materials#update", :as => "materials_update", :via => :put
    match "materials/edit/:id" => "materials#edit", :as => "materials_edit"
  end

  # JS session update timer route

  get "application/update_timer"

  # Seats resources
  # TODO: Break up into unique routes

  resources :seats
  
end