MySite::Application.routes.draw do
  root "pages#home"
  resources :articles
  controller :sessions do
    get "jimbonk_signin", to: :new
    post "jimbonk_signin", to: :create
    delete "signout", to: :destroy
  end

  get "jimbonk_admin", to: "admin#index", as: :admin
end
