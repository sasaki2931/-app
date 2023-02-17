Rails.application.routes.draw do
  root to: "tops#index"
  resource :tops, onli: [:show]
  resources :favorites, only: [:create, :destroy]
  resources :themes do
    resources :ideas, only: [:create, :destroy]
  end
  
  
  devise_for :users
  resources :users, only: [:show]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
 
end
