# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

match 'settings/plugin/latest_users' , :to => 'latest_users_setup#change'
post 'latest-users-setup/change', :to => 'latest_users_setup#change'
get 'latest-users-setup', :to => 'latest_users_setup#index'
