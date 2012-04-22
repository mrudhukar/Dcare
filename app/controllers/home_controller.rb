class HomeController < ApplicationController
  skip_before_filter :require_login

  def welcome
  	redirect_to user_path(current_user) if current_user
  end
end
