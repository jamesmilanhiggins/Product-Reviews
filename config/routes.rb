Rails.application.routes.draw do
    root :to => 'products#index'

  resources :products do
    resources :reviews, :exept => [:show, :index]
  end
end
