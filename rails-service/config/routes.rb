Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dummy_operations, only: [:index, :show, :create]

  resources :filter_operations, only: [:index, :show, :create]
end
