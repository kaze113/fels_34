Rails.application.routes.draw do

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :users,               only: [:index, :new, :show, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
  resources :categories,          only: [:index, :show]
  resources :words,               only: [:index]        

  namespace :admin do
    root                'static_pages#home'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'

    resources :users,              except: [:new, :create]     
    resources :words   
    resources :lessons 
    resources :results

    resources :categories do
      resources :words
    end
    
  end
end