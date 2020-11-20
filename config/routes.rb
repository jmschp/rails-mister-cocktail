Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, except: %i[index] do
    resources :doses, except: %i[index show new]
  end

  root to: 'cocktails#index'
end
