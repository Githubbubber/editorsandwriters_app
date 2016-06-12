class SessionsController < ActionController::Base
  def new
  end

  def create
    member = Member.find_by(email: params[:email].downcase)
    if member
      log_in member
      redirect_to member
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'index'
    end
  end

  def destroy(member)
    session.delete(:alter_ego)
    session.delete(:acct_type)
    session.delete(:first_name)
    log_out if logged_in?
  end
end
