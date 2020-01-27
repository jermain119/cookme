Rails.application.routes.draw do

  resources :categories, only: [:index, :show, :create, :new] do
    resources :recipes, only: [:new, :index ]
  end
 
  resources :recipes
  

  root to: "application#welcome"
  
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope:user do
    get 'login', to: 'devise/sessions#new'
    get 'signup ', to: 'devise/registrations#new'
  end

end
