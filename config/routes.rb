Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations", confirmations: 'confirmations' }

  get 'notre_histoire', to: 'pages#notre_histoire', as: :notre_histoire
  get 'notre_equipe', to: 'pages#notre_equipe', as: :notre_equipe
  get 'nos_actions', to: 'pages#nos_actions', as: :nos_actions
  get 'nous_soutenir', to: 'pages#nous_soutenir', as: :nous_soutenir
  get 'eshop', to: 'pages#eshop', as: :eshop
  get 'post_sign_up', to: 'pages#post_sign_up', as: :confirmation_compte

  resources :teams do
    resources :participants, only: [:new, :create]
    resources :comments, only: [:create, :destroy]
  end

  resources :profiles do
    resources :participants, only: [:show, :destroy]
      member do
        get :mon_inscription
      end
    resources :teams, only: [:show, :destroy] do
      member do
        put :accept_player, :deny_player, :close_subscriptions
      end
    end
    # resources :pulls, only: [:new, :create, :delete]
  end

  get 'nous_contacter', to: 'contacts#new', as: :nous_contacter
  get 'sponsor', to: 'contacts#sponsor', as: :sponsor
  resources :contacts, only: [:create]
  resources :pulls, only: [:new, :create, :delete]
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
