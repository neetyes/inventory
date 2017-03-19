Rails.application.routes.draw do

  devise_for :users

  resources :users
  resources :company_profiles
  resources :fiscal_years
  resources :items
  resources :units
  resources :stocks
  resources :item_groups
  resources :customers
  resources :suppliers
  resources :sales
  resources :purchases
  resources :logs

  root "systems#index"

  get 'systems/index'
  get 'company_profiles/index'
  get 'items/index'
  get 'units/index'
  get 'item_groups/index'
  get 'customers/index'
  get 'purchases/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
