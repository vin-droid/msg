Rails.application.routes.draw do
  get 'home/index'
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: redirect('/admin')
  match '/admin', to: 'admin/dashboard#index', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
