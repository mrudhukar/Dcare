class HomeController < ApplicationController
  skip_before_filter :require_login

  def welcome
  	redirect_to login_path()
  end
end
