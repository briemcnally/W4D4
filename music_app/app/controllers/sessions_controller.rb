class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      login_user!(user)
      flash[:success] = ["Successfully logged in"]
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Invalid credentials. Try again."]
      render :new
      redirect_to users_url
    end
  end

  def new
    render :new
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end

end
