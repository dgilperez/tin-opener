TinOpener::Engine.routes.draw do
  resources :data_sets, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :records
  end

  root 'data_sets#index'
end
