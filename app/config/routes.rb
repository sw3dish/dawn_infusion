Rails.application.routes.draw do
  root 'home#index'
  resources :stories do
    member do
      get 'lyra', as: 'preview_lyra', to: 'stories#preview_lyra'
      delete 'lyra', as: 'delete_lyra', to: 'stories#delete_lyra'
    end
  end
  resources :newsletters do
    member do
      get 'lyra', as: 'preview_lyra', to: 'newsletters#preview_lyra'
      delete 'lyra', as: 'delete_lyra', to: 'newsletters#delete_lyra'
    end
  end
end
