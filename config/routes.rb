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
