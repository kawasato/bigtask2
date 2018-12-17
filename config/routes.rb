Rails.application.routes.draw do
  root to: 'tops#index'
  
  resources :blogs do
    collection do
        post :confirm
    end
  end

    resources :users do
      collection do
          post :confirm
        end
      member do
          get 'favorite'
        end
      end

    resources :sessions, only: [:new, :create, :show, :destroy]
    resources :favorites, only: [:create, :destroy] 
    mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
