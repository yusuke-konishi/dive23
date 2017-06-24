Rails.application.routes.draw do
  root 'top#index'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources 'users', only: [:index, :show]
  resources :questions do
    resources :answers do
      resources :answer_votes, only: [] do
        collection do
          post :plus
          post :minus
        end
      end
    end
    resources :question_votes, only: [] do
      collection do
        post :plus
        post :minus
      end
    end
  end
  resources 'tags'
  resources :bookmarks, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
