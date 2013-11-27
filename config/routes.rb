Aarest::Application.routes.draw do
  resources :grants, except: [:new, :edit]
  resources :services, only: [:index, :show]
  resources :memberships, except: [:new, :edit]
  resources :accounts, except: [:new, :edit] do
    resources :groups, except: [:new, :edit] do
      resources :users, only: [:index]
    end
    resources :users, except: [:new, :edit] do
      resources :groups, only: [:index]
    end
  end
end
