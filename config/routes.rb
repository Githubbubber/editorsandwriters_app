Rails.application.routes.draw do
  # Root directory, or "/"
  root "members#index"

  # All routes related to members
  resources :members

  get   "signup",   to: "members#signup_login"
  get   "login",    to: "members#signup_login"
  patch "members",  to: "members#login"
  get   "logout",   to: "members#logout"

  # Other pages
  get   "help",           to: "members#help"
  get   "abouteaw",           to: "members#abouteaw"
  # get   "*",              to: "members#not_found"
end

# No route matches {:action=>"/members", :controller=>"members"}

# rake routes
#      Prefix Verb   URI Pattern                 Controller#Action
#        root GET    /                           members#index
#     members GET    /members(.:format)          members#index
#             POST   /members(.:format)          members#create
#  new_member GET    /members/new(.:format)      members#new
# edit_member GET    /members/:id/edit(.:format) members#edit
#      member GET    /members/:id(.:format)      members#show
#             PATCH  /members/:id(.:format)      members#update
#             PUT    /members/:id(.:format)      members#update
#             DELETE /members/:id(.:format)      members#destroy
#      signup GET    /signup(.:format)           members#signup_login
#       login GET    /login(.:format)            members#signup_login
#             PATCH  /members(.:format)          members#login
#      logout GET    /logout(.:format)           members#logout
#        help GET    /help(.:format)             members#help
#    abouteaw GET    /abouteaw(.:format)         members#abouteaw


