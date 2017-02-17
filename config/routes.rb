Rails.application.routes.draw do
	post 'pages', to: 'pages#create'
	get 'pages/:url', to: 'pages#show'
	get 'pages', to: 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
