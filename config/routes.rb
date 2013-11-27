Aarest::Application.routes.draw do
  resources :groups, except: [:new, :edit]
  resources :grants, except: [:new, :edit]
  resources :services, except: [:new, :edit]
  resources :memberships, except: [:new, :edit]
  resources :users, except: [:new, :edit]
  resources :accounts, except: [:new, :edit]
end
