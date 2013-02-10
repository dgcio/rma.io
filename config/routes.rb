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

  #Surveyors routes, sub inventory & orders routes

  match ":department/materials" => "materials#index", :as => "materials_index"

  namespace :materials do
    match "inventory/:department" => "inventory#create", :as => "inventory", :via => :post
    match "inventory" => "inventory#index"
    match ":department/inventory/new" => "inventory#new", :as => "inventory_new" 
    match ":id/:epartment/inventory" => "inventory#destroy", :as => "inventory_delete", :via => [:get, :delete]
    match "/inventory/view/:id" => "inventory#show", :as => "inventory_show"
    match "/inventory/:id" => "inventory#update", :as => "inventory_update", :via => :put
    match "/inventory/edit/:id" => "inventory#edit", :as => "inventory_edit"
  end

  # JS session update timer route

  get "application/update_timer"

  # Seats resources
  # TODO: Break up into unique routes

  resources :seats
  
end