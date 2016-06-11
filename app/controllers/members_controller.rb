class MembersController < ApplicationController
  include ApplicationHelper
  include BCrypt

  def index
    @members = false
    if session[:acct_type] == "editor"
      @members = Member.where(acct_type: "writer")
    elsif session[:acct_type] == "writer"
      @members = Member.where(acct_type: "editor")
    end
    # byebug
    render :index
  end

  def signup_login
    if session[:acct_type]
      if session[:acct_type] == "editor"
        @members = Member.where(acct_type: "writer")
      elsif session[:acct_type] == "writer"
        @members = Member.where(acct_type: "editor")
      else
        @members = false
      end
      render :index
    else
      @member = Member.new
    end
    render :enter
  end

  def login
    @user = Member.where(alter_ego: params["alter_ego"])
    @user = @user[0]
    if  @user
        # loginnum = @user.loginnum
      # if @user.is_password?(password) && @user.acct_type == "#{params[:acct_type]}"

      if Password.new(@user.password_digest) == "#{params[:password_digest]}" && @user.acct_type == "#{params[:acct_type]}"
        session[:alter_ego] = @user.alter_ego
        session[:acct_type] = @user.acct_type
        # loginnum = loginnum + 1
        # @user.update(loginnum: loginnum.to_i)
        if session[:acct_type] == "editor"
          @members = Member.where(acct_type: "writer")
        elsif session[:acct_type] == "writer"
          @members = Member.where(acct_type: "editor")
        # byebug
        else
          @members = false
        end
        flash[:success] = "Login successful!"
        render :index
      else
        # byebug
        flash[:failure] = "Invalid login info. Please try again."
        render :index
      end
    end
  end

  def logout
    session.delete(:alter_ego)
    session.delete(:acct_type)
    redirect_to "/"
  end

  def show
    # set_member
    @member = Member.find_by(id: params[:id].to_i)
    render :show
  end

  def new
  end

  def edit
  end

  def create(hk = nil, fsm = nil, fr = nil)
    if params[:member][:password_digest] == params[:member][:password_confirmation]

      @member = Member.create(avatar: "http://www.test.com/test.jpg", first_name: "#{params[:member][:first_name]}", last_name: "#{params[:member][:last_name]}", email: "#{params[:member][:email]}", alter_ego: "#{params[:member][:alter_ego]}", password_digest: "#{params[:member][:password_digest]}", location: "#{params[:member][:location]}", title: "#{params[:member][:title]}", education: "#{params[:member][:education]}", haiku: "#{params[:member][:haiku]}", fav_style_manual: "#{params[:member][:fav_style_manual]}", fav_rule: "#{params[:member][:fav_rule]}", acct_type: "#{params[:member][:acct_type]}")

      @password = Password.create("#{params[:member][:password_digest]}")
      @member.update_attribute(:password_digest, @password)
      respond_to do |format|
        if @member.alter_ego
          session[:alter_ego] = @member.alter_ego
          session[:acct_type] = @member.acct_type
        if session[:acct_type] == "editor"
          @members = Member.where(acct_type: "writer")
        elsif session[:acct_type] == "writer"
          @members = Member.where(acct_type: "editor")
        else
          @members = false
        end
          format.html { redirect_to @member, notice: 'Member was successfully created.' }
          format.json { render :show, status: :created, location: @member }
        else
          format.html { render :index }
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
    else
      render :show
    end
  end

  def update(hk = "", fsm = "", fr = "")
    # fn = params[:member][:first_name]
    # ln = params[:member][:last_name]
    # email = params[:member][:email]
    # ae = params[:member][:alter_ego]
    # pw = params[:member][:password_digest]
    # loc = params[:member][:location]
    # title = params[:member][:title]
    # edu = params[:member][:education]
    # hk = params[:member][:haiku]
    # fsm = params[:member][:fav_style_manual]
    # fr = params[:member][:fav_rule]
    # act = params[:member][:acct_type]

    @member = Member.find(params[:member][:id].to_i)
    # av = @member.avatar
    respond_to do |format|
      if @member.update_attributes(first_name: "#{params[:member][:first_name]}", last_name: "#{params[:member][:last_name]}", email: "#{params[:member][:email]}", alter_ego: "#{params[:member][:alter_ego]}", password_digest: "#{params[:member][:password_digest]}", location: "#{params[:member][:location]}", title: "#{params[:member][:title]}", education: "#{params[:member][:education]}", haiku: "#{params[:member][:haiku]}", fav_style_manual: "#{params[:member][:fav_style_manual]}", fav_rule: "#{params[:member][:fav_rule]}", acct_type: "#{params[:member][:acct_type]}")
        #For keeping the avatar put: @member.update_attributes(avatar: av, first_name: "#{params[:member][:first_name]}", last_name: "#{params[:member][:last_name]}", email: "#{params[:member][:email]}", alter_ego: "#{params[:member][:alter_ego]}", password_digest: "#{params[:member][:password_digest]}", location: "#{params[:member][:location]}", title: "#{params[:member][:title]}", education: "#{params[:member][:education]}", haiku: "#{params[:member][:haiku]}", fav_style_manual: "#{params[:member][:fav_style_manual]}", fav_rule: "#{params[:member][:fav_rule]}", acct_type: "#{params[:member][:acct_type]}")
        flash[:success] = "You info is now updated."
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member = Member.find(params[:id].to_i)

    @member.destroy
    respond_to do |format|
      flash[:success] = "You're now removed."
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def help
  end

  def abouteaw
  end

  def not_found
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_member
    #   @member = Member.find(params[:id].to_i)
    # end

    def member_params
      params.require(:member).permit(:avatar, :first_name, :last_name, :email, :alter_ego, :password_digest, :location, :title, :education, :haiku, :fav_style_manual, :fav_rule, :acct_type)
    end
end
