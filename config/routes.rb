Rails.application.routes.draw do
  root 'questions#index'

  resources :questions, only: [:new, :index, :create, :show]
  resources :answers, only: [:new, :create, :show] do
    member do
      get 'upvote_answer'
    end
  end

  get '/similar_questions' => 'questions#similar_questions', as: :similar_questions
end