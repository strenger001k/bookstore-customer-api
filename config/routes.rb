# frozen_string_literal: true

Rails.application.routes.draw do
  scope 'api/v1' do
    devise_for :users, path: '',
                       path_names: {
                         sign_in: 'login',
                         sign_out: 'logout',
                         registration: 'signup'
                       },
                       controllers: {
                         sessions: 'api/v1/sessions',
                         registrations: 'api/v1/registrations'
                       }, defaults: { format: :json }
  end

  namespace :api do
    namespace :v1 do
      get 'current_user', to: 'current_user#index'

      resources :books, except: %i[new edit update]
    end
  end
end
