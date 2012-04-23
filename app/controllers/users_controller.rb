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
    #@phones = Phone.where(:user_id => @user.id)
    #logger.info 'No phones' if @phones.size == 0
    #@phones = @user.phones
    #logger.info 'Have phones' if @phones.size != 0
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
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
