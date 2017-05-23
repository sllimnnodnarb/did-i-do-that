Rails.application.routes.draw do

  devise_for :users
  devise_for :views

  get 'users/new'

  get 'users/show'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
