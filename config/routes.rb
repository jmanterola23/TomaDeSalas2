Rails.application.routes.draw do
  resources :rooms do
    get 'meets', to: 'meets#index'
  end
  resources :meets do
    post 'reserve', on: :member
  end # Aquí cerramos el bloque de resources :meets
end
