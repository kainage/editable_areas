Rails.application.routes.draw do
  resources :editable_areas, only: :update
end