Rails.application.routes.draw do
  resources :rooms do
    resources :meets, only: [:index] do
      member do
        post 'reserve'
        post 'cancel_reservation'
      end
    end
  end
end
