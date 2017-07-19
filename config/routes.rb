Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    scope module: :v1, constraints: ApiVersion.new("v1") do
      resources :products
    end
    scope module: :v2, constraints: ApiVersion.new("v2", true) do
      resources :products
    end
  end
  resources :products
  root to: "products#index"
end
