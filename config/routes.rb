Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      patch 'user_jobs/with_user/:user_id/with_job/:job_id', to: 'user_jobs#move_column'
      resources :users
      resources :user_jobs
      resources :jobs
      resources :tasks
    end
  end
end
