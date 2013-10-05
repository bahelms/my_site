MySite::Application.routes.draw do
  root "pages#home"
  resources :articles
  resources :sessions, only: [:new, :create, :destroy]

  get "jimbonk_admin", to: "admin#index", as: :admin
end
