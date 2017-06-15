Rails.application.routes.draw do
  root 'home#index'
  get 'group/accept'

  get 'group/denial'

  get 'time/save'
  
  get 'time/edit'

  get 'time/delete'

  get 'time/get_personal'

  get 'time/get_common'

  get 'get_common_timetable/time_list'

  get 'destroy/:post_id' => 'group#destroy'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
