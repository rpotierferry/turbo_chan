Rails.application.routes.draw do
  devise_for :users

  root 'boards#index'
  resources :boards do
    resources :board_threads do
      resources :posts do
        member do
          post 'upvote'
          post 'downvote'
          get 'new_reply'
          post 'create_reply'
        end
      end
    end
  end
end
