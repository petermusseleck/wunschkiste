class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to select_path,
        notice: "Du hast dich angemeldet!"
    else
      flash.now.alert = "Fehlerhafte Email-Adresse oder Passwort!"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] =nil
    redirect_to goodbye_path,
      notice: "Du hast dich erfolgreich abgemeldet!"
  end
  
end
