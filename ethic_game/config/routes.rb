Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/show'
  # get '/:scenario' => 'welcome#show', as: 'show'
  #get '/show/:scenario' => 'welcome#show', as: 'show'
  get 'welcome/:id' => 'welcome#detail', as: 'detail'
  get 'show/:id(/:active)' => 'welcome#show', as: 'show'
  get 'show_history/:id(/:active)' => 'welcome#show_history', as: 'show_history'
  post 'show/:id(/:active)' => 'welcome#show', as: 'show_input'
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
