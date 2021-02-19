Rails.application.routes.draw do
    devise_for :user, :controllers => {
        registrations: 'registrations'
    }
    root "users#home"
    resources :users do
        resources :tasks,  shallow: true
    end
end
