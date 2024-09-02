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
  resources :posts do
    resources :votes do
      member do
        post 'upvote'
        post 'downvote'
      end
    end
  end
  resources :users, only: [:show] do
    member do
      get 'see_posts'
      get 'see_replies'
    end
  end
end
