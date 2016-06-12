require 'test_helper'

class MembersLoginTest < ActionDispatch::IntegrationTest
  # test "login with valid information followed by logout" do
  #   get login_path
  #   post login_path, session: { email: @member.email, password_digest: 'password' }
  #   assert is_logged_in?
  #   assert_redirected_to @member
  #   follow_redirect!
  #   assert_template 'members/show'
  #   assert_select "a[href=?]", login_path, count: 0
  #   assert_select "a[href=?]", logout_path
  #   assert_select "a[href=?]", member_path(@member)
  #   delete logout_path
  #   assert_not is_logged_in?
  #   assert_redirected_to root_url
  #   # Simulate a user clicking logout in a second window.
  #   delete logout_path
  #   follow_redirect!
  #   assert_select "a[href=?]", login_path
  #   assert_select "a[href=?]", logout_path,      count: 0
  #   assert_select "a[href=?]", member_path(@member), count: 0
  # end
end
