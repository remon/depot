class SessionsController < ApplicationController
  layout 'reg'
   skip_before_filter :authorize
  def new
    
  end

  def create
    if user =User.authenticate(params[:name],params[:password])
      session[:user_id]= user.id
      redirect_to store_url
    else
      redirect_to login_url, flash.now[:alert]=>"Invaild user/password combination "
    end
    end
  #end

  def destroy
    session[:user_id]= nil
    redirect_to store_url,:notice=>"Logged Out "
  end
end
