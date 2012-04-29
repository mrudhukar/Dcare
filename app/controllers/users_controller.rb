class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

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
    logger.info 'Entered edit action'
    @user = User.find(params[:id])
    logger.info 'Logging phone'
    logger.info @user.phone.mobile_number
    logger.info 'Logged phone'
    #@phones = Phone.where(:user_id => @user.id)
    #logger.info 'No phones' if @phones.size == 0
    #@phones = @user.phones
    #logger.info 'Have phones' if @phones.size != 0
  end

  def update
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
  end

  def index
  end
end
