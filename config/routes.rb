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
  match "users/create", :as => "users", :via => [:post, :get]
  match "logout" => "users#destroy"

  #Surveyors routes, sub inventory & orders routes

  match ":department/mats" => "mats#index", :as => "mats", via: [:get]
  match ":department/mats" => "mats#create", via: [:post]
  match ":department/mats/new" => "mats#new", :as => "new_mat", via: [:get]
  match ":department/mats/:id/edit" => "mats#edit", :as => "edit_mat", via: [:get]
  match "mats/:id" => "mats#show", :as => "mat", via: [:get]
  match ":department/mat/:id" => "mats#update",:as => "mat", via: [:put]
  match ":department/mat/:id" => "mats#destroy", :as => "mats_del", via: [:get, :destroy]



  # JS session update timer route

  get "application/update_timer"

  # Seats resources
  # TODO: Break up into unique routes

  resources :seats
  
end

 # mats      GET        /mats(.:format)                            mats#index
 #           POST       /mats(.:format)                            mats#create
 # new_mat   GET        /mats/new(.:format)                        mats#new
 # edit_mat  GET        /mats/:id/edit(.:format)                   mats#edit
 # mat       GET        /mats/:id(.:format)                        mats#show
 #           PUT        /mats/:id(.:format)                        mats#update
 #           DELETE     /mats/:id(.:format)                        mats#destroy
