Rails.application.routes.draw do
  get 'group/accept'

  get 'group/denial'

  get 'get_common_timetable/time_list'

  root 'home#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
