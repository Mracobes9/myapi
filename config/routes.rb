Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'users/signin' => 'users#signin'
      resources :users do
        member do
          get 'questions'
          get 'answers'
        end
      end
      resources :questions
      resources :answers
      resources :category do
        member do
          get 'questions'
        end
      end
    end
  end
end
