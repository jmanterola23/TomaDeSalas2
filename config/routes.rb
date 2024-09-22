Rails.application.routes.draw do
  resources :rooms do
    resources :meets, only: [:index] do
      post 'reserve', on: :member
      post 'cancel_reservation', on: :member
    end
  end  
end
