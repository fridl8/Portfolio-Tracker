Rails.application.routes.draw do
  resources :portfolios, only: [:new, :create, :index, :destroy, :show, :update, :edit] do
    resources :positions, except: [:show, :index]
  end

  devise_for :users

  devise_scope :user do
  	root :to => 'devise/sessions#new'
	end

	resources :stocks, except: [:show, :index]
end
