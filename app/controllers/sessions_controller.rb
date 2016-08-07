class SessionsController < ApplicationController
  def new
    redirect_to events_path if current_user
    @login_url = if Rails.env.production?
                   do_login_url(protocol: 'https')
                 else
                   do_login_url
                 end
  end

  def create
    user = User.find_by_name(session_params[:name])
    if authenticate(user)
      session[:user_id] = user.id
      redirect_to admin_works_path, notice: "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end

  private

  def authenticate(user)
    user && user.authenticate(session_params[:password])
  end

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
