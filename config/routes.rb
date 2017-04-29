Rails.application.routes.draw do
  resources :recipes
  root 'recipes#index'
  resources :ingredients do
    collection do
        get "add"
    end
  end
end
