Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  resources :events, constraints: { id: /\d+/ } do
    resources :attendances, only: [:create]
  end

  root "events#index"
end
