Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :users
  resources :posts do
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'get_category_children', to:'posts#get_category_children', defaults: { format: 'json' }
    end
  end
end
