class MainController < ApplicationController
  def index
    flash.now[:alert] = "Logged in!"  
  end
end
