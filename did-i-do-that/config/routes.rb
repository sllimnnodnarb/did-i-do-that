Rails.application.routes.draw do

  devise_for :users do
    resources :items, only: [:create, :show, :edit]
  end

  devise_for :views

  resources :items

  get 'items/index'

  get 'users/new'

  get 'users/show'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
