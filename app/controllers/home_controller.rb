class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def splash_page

  end
  
end
