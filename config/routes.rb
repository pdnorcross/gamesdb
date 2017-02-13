Rails.application.routes.draw do
  root 'home#index'
  
  resources :reporting do
  end

  resources :home do
  end

  resources :settings do
    collection do
      post :clear_sys
      post :clear_game
      post :urls
      post :owned_or_not_sett
    end
  end
  
  resources :systems do
    collection do
     post :import
    end
  end

  resources :games do
    collection do
      post :import
      get :searching
      get :console
    end
  end
end
