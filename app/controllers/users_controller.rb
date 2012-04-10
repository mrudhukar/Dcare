class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
    @tab = TabConstants::REGISTER
  end

  def create
    if @user.save
      redirect_to user_url(@user)
    else
      @tab = TabConstants::REGISTER
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfull updated your profile"
      redirect_to user_path(@user)
    else
      render :action => "edit"
    end
  end

  def show
    @tab = TabConstants::HOME
  end

  def index
  end
end
