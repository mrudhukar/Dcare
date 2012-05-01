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
  end

  def update
    user = params[:user]
    
    #Adding phone
    phones = Phone.where(:user_id => @user.id)
    phone = if phones.size == 0
      Phone.new
    else
      phones.first
    end
    phone.update_attributes(user[:phone])
    user[:phone] = phone
    
    #Adding address
    addresses = Address.where(:user_id => @user.id)
    address = if addresses.size == 0
      Address.new
    else
      addresses.first
    end
    address.update_attributes(user[:address])
    user[:address] = address
    
    if @user.update_attributes(user)
      flash[:notice] = "Successfull updated your profile"
      redirect_to user_path(@user)
    else
      render :action => "edit"
    end
  end

  def show
    # @tab = TabConstants::HOME
    logger.info flash.inspect
  end

  def index
  end

  def dashboard
    redirect_to welcome_path() unless current_user
  end

end
