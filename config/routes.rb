MySite::Application.routes.draw do
  root 'pages#home'
  resources :articles
end
