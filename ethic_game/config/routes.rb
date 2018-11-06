Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/show'
  # get '/:scenario' => 'welcome#show', as: 'show'
  #get '/show/:scenario' => 'welcome#show', as: 'show'
  get 'welcome/:id' => 'welcome#detail', as: 'detail'
  get 'show/:id' => 'welcome#show', as: 'show'
  get 'show_history/:id' => 'welcome#show_history', as: 'show_history'
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
