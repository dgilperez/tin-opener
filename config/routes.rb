TinOpener::Engine.routes.draw do
  resources :data_sets do
    resources :records
  end
end
