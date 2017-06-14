Rails.application.routes.draw do

  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  get '/goodbye',     to: 'welcome#goodbye'

  resources :users do
    member do
      get :delete
    end

    resources :quizzes do
      member do
        get :delete
      end

      resources :questions do
        member do
          get :delete
        end
      end
      # end of questions resource
    end
    # end of quizzes resource
  end
  # end of users resource


  root 'welcome#index'

  match ':controller(/:action(/:id))', :via => [:get, :post]

end
