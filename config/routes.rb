TinOpener::Engine.routes.draw do
  resources :data_sets do
    resources :records
  end

  root 'data_sets#index'
end
