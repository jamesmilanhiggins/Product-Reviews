Rails.application.routes.draw do
    root :to => 'home#index'

  resources :products do
    resources :reviews, :exept => [:show, :index]
  end
end
