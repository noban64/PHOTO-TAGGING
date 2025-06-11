Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: "json" } do
    scope module: :v1 do
      get "v1/data/:id", to: "level#data"
    end
  end

  get "/about", to: "level#about"
  get "/level/:id", to: "level#level"
  get "/scoreboard", to: "scoreboard#view"
  root "level#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check#
  #
end
