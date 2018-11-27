Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/:id' => 'welcome#detail', as: 'detail'
  post 'welcome/create_player/:scenario_id' => 'welcome#create_player', as: 'create_player'
  get 'show_history/:id(/:active_id)' => 'welcome#show_history', as: 'show_history'
  post 'post_question/:id/:active_id' => 'welcome#reply_to_question', as: 'reply_to_question'
  
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
