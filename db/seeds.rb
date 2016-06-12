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

@member = Member.create(avatar: "http://w1.net/w1.jpg", first_name: "w1", last_name: "w1", email: "w1@w1.com", alter_ego: "w1", password_digest: "w1w1w1w1", location: "w1", title: "w1", education: "w1", haiku: "w1 w1w1w1 w1w1", fav_style_manual: "", fav_rule: "", acct_type: "writer" )
@password = BCrypt::Password.create("w1w1w1w1")
@member.update_attribute(:password_digest, @password)

@member = Member.create(avatar: "http://e1.net/e1.jpg", first_name: "e1", last_name: "e1", email: "e1@e1.com", alter_ego: "e1", password_digest: "e1e1e1e1", location: "e1", title: "e1", education: "e1", haiku: "", fav_style_manual: "Strunk N White", fav_rule: "e1 e1e1!", acct_type: "editor" )
@password = BCrypt::Password.create("e1e1e1e1")
@member.update_attribute(:password_digest, @password)
