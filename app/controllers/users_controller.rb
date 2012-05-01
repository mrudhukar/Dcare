class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create, :dashboard]
  load_and_authorize_resource :except => [:dashboard]

  def new
    # @tab = TabConstants::REGISTER
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.valid?
    captcha_success = verify_recaptcha
    if captcha_success && @user.save
      redirect_to user_url(@user)
    else
      flash.delete(:recaptcha_error)
      flash.now[:error] = "Please re-enter the words from the image again!" unless captcha_success
      # @tab = TabConstants::REGISTER
      render :action => "new"
    end
  end

  def edit
    phone   = @user.phone   || @user.build_phone
    address = @user.address || @user.build_address
  end

  def settings
  end

  def update
    if params[:settings] == "true"
      handle_settings_update
      return
    end

    user = params[:user].slice(*[:name, "date_of_birth(3i)", "date_of_birth(2i)", "date_of_birth(1i)", :gender, :phone_attributes, :address_attributes])
        
    if @user.update_attributes(user)
      redirect_to user_path(@user), :notice => "Successfull updated your profile"
    else
      render :action => "edit"
    end
  end

  def show
    # @tab = TabConstants::HOME
  end

  def index
  end

  def dashboard
    redirect_to welcome_path() unless current_user
  end

  private

  def handle_settings_update
    user = params[:user].slice(*[:email, :password, :password_confirmation])
    if @user.update_attributes(user)
      redirect_to root_path(), :notice => "Successfull updated your settings"
    else
      render :action => "settings"
    end

  end

end
