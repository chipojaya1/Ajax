Rails.application.routes.draw do
  resources :blogs do
    resources :comments
    end
  root to: "blogs#index"
end
