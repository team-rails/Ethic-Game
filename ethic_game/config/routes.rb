Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/show'
  # get '/:scenario' => 'welcome#show', as: 'show'
  get '/show/:scenario' => 'welcome#show', as: 'show'
  get '/:scenario' => 'welcome#detail', as: 'detail'
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
