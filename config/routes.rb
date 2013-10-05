MySite::Application.routes.draw do
  root "pages#home"
  resources :articles
  controller :sessions do
    get "login" => :new
    post "login" => :create
    delete "logout" => :destroy
  end

  get "jimbonk_admin", to: "admin#index", as: :admin
end
