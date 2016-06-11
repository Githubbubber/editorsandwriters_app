require 'test_helper'

class MembersControllerTest < ActionController::TestCase

  def setup
    @member = Member.new(avatar: "http://e.net/e.jpg", first_name: "e", last_name: "e", email: "eee@eee.com", alter_ego: "eee", password: "foobar123", password_confirmation: "foobar123", location: "e", title: "e", education: "e", haiku: "", fav_style_manual: "e", fav_rule: "e. Yup.", acct_type: "editor")
  end

  test "should add user" do
    assert_response :success
  end

  test "first name should be present" do
    @member.first_name = "     "
    assert_not @member.valid?
  end

  test "alter ego should be present" do
    @member.alter_ego = "     "
    assert_not @member.valid?
  end

  test "account type should be present" do
    @member.acct_type = "     "
    assert_not @member.valid?
  end

  test "password should be present" do
    @member.password_digest = "     "
    assert_not @member.valid?
  end

  test "email should be present" do
    @member.email = "     "
    assert_not @member.valid?
  end

  test "alter ego should not be too long" do
    @member.alter_ego = "a" * 51
    assert_not @member.valid?
  end

  test "email should not be too long" do
    @member.email = "a" * 244 + "@example.com"
    assert_not @member.valid?
  end

  # test "email validation should accept valid addresses" do
  #   valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
  #   valid_addresses.each do |valid_address|
  #     @member.email = valid_address
  #     assert @member.valid?, "#{valid_address.inspect} should be valid"
  #   end
  # end

  # test "email addresses should be unique" do
  #   duplicate_user = @member.dup
  #   @member.save
  #   assert_not duplicate_user.valid?
  # end

  test "password should be present (nonblank)" do
    @member.password_digest = @member.password_confirmation = " " * 6
    assert_not @member.valid?
  end

  test "password should have a minimum length" do
    @member.password_digest = @member.password_confirmation = "a" * 5
    assert_not @member.valid?
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  # test "should show 404 error image" do
  #   get :not_found
  #   assert_response :success
  # end

  # test "should check password_digest" do
  #   password = "e4e4e4e4"
  #   @user = Member.find_by(alter_ego: "e4")
  #   @user.is_password?(password)
  #   assert_response :success
  # end
end
