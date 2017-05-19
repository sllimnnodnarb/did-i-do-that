Rails.application.routes.draw do

  get 'users/new'

  get 'users/show'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  devise_for :users
  devise_for :views

end
