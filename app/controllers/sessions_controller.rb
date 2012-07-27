class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to recipes_path,
                  notice: "Sie haben sich angemeldet"
    else
      flash.now.alert = "Fehlerhafter Username oder Password"
      render action: "new"
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path,
                notice: "Sie haben Sich ausgeloggt."
  end

end
