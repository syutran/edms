class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def user_info
    
  end
end
