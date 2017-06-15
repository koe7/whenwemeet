Rails.application.routes.draw do
  get 'time/save'

  get 'time/delete'

  get 'time/get_personal'

  get 'time/get_common'

  get 'get_common_timetable/time_list'

  root 'home#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
