MySite::Application.routes.draw do
  root "pages#home"
  resources :articles
  controller :sessions do
    get "signin", to: :new
    post "signin", to: :create
    delete "signout", to: :destroy
  end

  get "jimbonk_admin", to: "admin#index", as: :admin
end
