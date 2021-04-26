Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'merchants#welcome'
  
  resources :merchants, only: [:index] do
    resources :items, shallow: true
    resources :discounts  #only: [:index, :show]
  end       #nested  :index,:new,:create
  # resources :items, only: [:show, :edit, :update]

###### Merchant Invoices routes below ######

########## Admin routes below ##############
 
  get "/merchants/:id/dashboard", to: 'merchants#show'
  get "/merchants/:id/invoices", to: 'merchants#invoice_index'
  get "/merchants/:merchant_id/invoices/:invoice_id", to: 'merchants#invoice_show'
  patch "/merchants/:merchant_id/invoices/:invoice_id", to: 'merchants#update'

  resources :admin, only: [:index]
  namespace :admin do
    resources :invoices, only: [:index, :show, :update]
    resources :merchants, except: [:destroy]
  end
end
