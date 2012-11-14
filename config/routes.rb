Standup::Application.routes.draw do
  resources :projects do
    resources :users, :only => :destroy
  end

  devise_for :users

  root :to => "home#index"
end
