Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      patch 'user_jobs/with_user/:user_id/with_job/:job_id', to: 'user_jobs#move_column'
      post 'users/login', to: 'users#login'
      post 'jobs/from_listings', to: 'jobs#add_from_job_listings'
      get 'current_user', to: 'users#get_user_from_token'
      resources :users
      resources :user_jobs
      resources :jobs
      resources :tasks
    end
  end
end
