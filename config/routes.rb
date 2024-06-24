Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'proponentes#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :proponentes do
    resource :contato
    resource :endereco

    collection do
      post 'calcular_inss'
      get 'relatorio' => 'proponentes#relatorio_funcionarios'
    end
  end
end
