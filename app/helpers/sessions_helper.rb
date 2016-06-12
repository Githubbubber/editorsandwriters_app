module SessionsHelper
  def log_in(member)
    session[:alter_ego] = member.alter_ego
    session[:acct_type] = member.acct_type
    session[:first_name] = member.first_name
  end

  def current_member
    @current_member ||= Member.find_by(alter_ego: session[:alter_ego])
  end

  def logged_in?
    !current_member.nil?
  end

  def log_out
    session.delete(:alter_ego)
    session.delete(:acct_type)
    session.delete(:first_name)
    @current_member = nil
  end
end
