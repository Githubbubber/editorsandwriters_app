class MembersController < ApplicationController
  include ApplicationHelper
  include BCrypt

  def index
    @members = false
    if session[:acct_type] == "editor"
      @members = Member.where(acct_type: "writer")
    elsif session[:acct_type] == "writer"
      @members = Member.where(acct_type: "editor")
    else
      @members = false
    end
    render :index
  end

  def signup_login
    if session[:acct_type] == "editor"
      @members = Member.where(acct_type: "writer")
    elsif session[:acct_type] == "writer"
      @members = Member.where(acct_type: "editor")
    else
      @members = false
    end
    @member = Member.new
    render :index
  end

  def login
    @member = Member.where(alter_ego: params["alter_ego"])
    @member = @member[0]
    if  @member
      if BCrypt::Password.new(@member.password_digest) == "#{params[:password_digest]}" && @member.acct_type == "#{params[:acct_type]}"
        session[:alter_ego] = @member.alter_ego
        session[:acct_type] = @member.acct_type
        session[:first_name] = @member.first_name
        if session[:acct_type] == "editor"
          @members = Member.where(acct_type: "writer")
        elsif session[:acct_type] == "writer"
          @members = Member.where(acct_type: "editor")
        else
          @members = false
        end
        render :index
      else
        flash[:failure] = "Invalid login info. Please try again."
        render :index
      end
    end
  end

  def logout
    if session[:acct_type]
      session.delete(:alter_ego)
      session.delete(:acct_type)
      session.delete(:first_name)
      redirect_to "/"
    else
      render :index
    end
  end

  def show
    if session[:acct_type]
      @member = Member.find(params[:id])
      render :show
    else
      render :index
    end
  end

  def new
    if session[:acct_type] == "" || session[:acct_type] == nil || session[:acct_type] == false
      @member = Member.new
    else
      render :index
    end
  end

  def edit
  end

  def create(hk = nil, fsm = nil, fr = nil)
    if session[:acct_type]
      render :index
    end

    if params[:password_digest] == params[:password_confirmation]
      @member = Member.create(avatar: "http://www.test.com/test.jpg", first_name: "#{params[:first_name]}", last_name: "#{params[:last_name]}", email: "#{params[:email]}", alter_ego: "#{params[:alter_ego]}", password_digest: "#{params[:password_digest]}", aboutme: "#{params[:aboutme]}", location: "#{params[:location]}", title: "#{params[:title]}", education: "#{params[:education]}", haiku: "#{params[:haiku]}", fav_style_manual: "#{params[:fav_style_manual]}", fav_rule: "#{params[:fav_rule]}", acct_type: "#{params[:acct_type]}")
      @password = BCrypt::Password.create("#{params[:password_digest]}")
      @member.update_attribute(:password_digest, @password)
      respond_to do |format|
        if @member.alter_ego != nil
          session[:alter_ego] = @member.alter_ego
          session[:acct_type] = @member.acct_type
          session[:first_name] = @member.first_name
          if session[:acct_type] == "editor"
            @members = Member.where(acct_type: "writer")
          elsif session[:acct_type] == "writer"
            @members = Member.where(acct_type: "editor")
          else
            @members = false
          end
          log_in @member
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
    if session[:acct_type]
      @member = Member.find(params[:member][:id])
      respond_to do |format|
        if @member.update_attributes(first_name: "#{params[:member][:first_name]}", last_name: "#{params[:member][:last_name]}", email: "#{params[:member][:email]}", alter_ego: "#{params[:member][:alter_ego]}", password_digest: "#{params[:member][:password_digest]}", aboutme: "#{params[:aboutme]}", location: "#{params[:member][:location]}", title: "#{params[:member][:title]}", education: "#{params[:member][:education]}", haiku: "#{params[:member][:haiku]}", fav_style_manual: "#{params[:member][:fav_style_manual]}", fav_rule: "#{params[:member][:fav_rule]}", acct_type: "#{params[:member][:acct_type]}")
          format.html { redirect_to @member, notice: 'Member was successfully updated.' }
          format.json { render :show, status: :ok, location: @member }
        else
          format.html { render :edit }
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    if session[:acct_type]
      @member = Member.find(params[:id])
      @member.destroy
      session.delete(:alter_ego)
      session.delete(:acct_type)
      session.delete(:first_name)
      log_out
      respond_to do |format|
        flash[:success] = "You're now removed."
        format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      render :index
    end
  end

  def help
  end

  def abouteaw
  end

  def not_found
  end
end
