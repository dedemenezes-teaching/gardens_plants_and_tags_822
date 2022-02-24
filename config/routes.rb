Rails.application.routes.draw do
  resources :gardens do
    resources :plants, only: %i[new create]
  end

  resources :plants, only: :destroy do
    resources :plant_tags, only: %i[new create]
  end

  resources :plant_tags, only: :destroy
end
