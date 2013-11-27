Aarest::Application.routes.draw do
  resources :services, only: [:index, :show]
  resources :accounts,          except: [:new, :edit] do
    resources :groups,          except: [:new, :edit] do
      resources :users,         only: [:index]
      resources :memberships,   only: [:index, :create, :destroy]
      resources :grants,        only: [:index, :create, :destroy]
    end
    resources :users,           except: [:new, :edit] do
      resources :groups,        only: [:index]
      resources :memberships,   only: [:index]
      resources :grants,        only: [:index]
    end
  end
end
