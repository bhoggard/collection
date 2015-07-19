class SessionsController < ApplicationController  
  def new  
    if current_user
      redirect_to events_path
    end
  end  

  def create
    user = User.find_by_name(session_params[:name])
    if user && user.authenticate(session_params[:password])  
      session[:user_id] = user.id  
      redirect_to admin_nationalities_path, notice: "Logged in!"  
    else  
      flash.now.alert = "Invalid email or password"  
      render "new"  
    end  
  end  

  def destroy  
    session.delete(:user_id)
    redirect_to root_url, notice: "Logged out!"  
  end  

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end

end  
