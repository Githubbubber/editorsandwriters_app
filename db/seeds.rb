# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


=begin
Members have
  :avatar, :first_name, :last_name, :email, :alter_ego, :password_digest, :location, :title, :education, :haiku, :fav_style_manual, :fav_rule, :acct_type
=end

# Member.destroy_all

Member.create(avatar: "http://w1.net/w1.jpg", first_name: "w1", last_name: "w1", email: "w1@w1.com", alter_ego: "w1", password_digest: "w1w1w1w1", location: "w1", title: "w1", education: "w1", haiku: "w1 w1w1w1 w1w1", fav_style_manual: "", fav_rule: "", acct_type: "writer" )

Member.create(avatar: "http://w2.net/w2.jpg", first_name: "w2", last_name: "w2", email: "w2@w2.com", alter_ego: "w2", password_digest: "w2w2w2w2", location: "w2", title: "w2", education: "w2", haiku: "w2 w2w2w2 w2w2", fav_style_manual: "", fav_rule: "", acct_type: "writer" )

Member.create(avatar: "http://w3.net/w3.jpg", first_name: "w3", last_name: "w3", email: "w3@w3.com", alter_ego: "w3", password_digest: "w3w3w3w3", location: "w3", title: "w3", education: "w3", haiku: "w3 w3w3w3 w3w3", fav_style_manual: "", fav_rule: "", acct_type: "writer" )

Member.create(avatar: "http://e1.net/e1.jpg", first_name: "e1", last_name: "e1", email: "e1@e1.com", alter_ego: "e1", password_digest: "e1e1e1e1", location: "e1", title: "e1", education: "e1", haiku: "", fav_style_manual: "Strunk N White", fav_rule: "e1 e1e1!", acct_type: "editor" )

Member.create(avatar: "http://e2.net/e2.jpg", first_name: "e2", last_name: "e2", email: "e2@e2.com", alter_ego: "e2", password_digest: "e2e2e2e2", location: "e2", title: "e2", education: "e2", haiku: "", fav_style_manual: "Chicago", fav_rule: "e2 because e2 e22222.", acct_type: "editor" )
