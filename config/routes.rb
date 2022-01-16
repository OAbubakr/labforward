Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      get :moving_z_score, to: 'z_score#moving_z_score'
      get :z_score, to: 'z_score#z_score'
    end
  end
end
