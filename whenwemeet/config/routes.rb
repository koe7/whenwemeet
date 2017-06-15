Rails.application.routes.draw do
  get 'get_common_timetable/time_list'

  get 'home/popup'

  post 'home/groupadd'

  root 'home#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
