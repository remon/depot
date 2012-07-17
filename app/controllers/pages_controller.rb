class PagesController < ApplicationController
  layout 'reg2'
  def home
    if @user= User.find_by_id(session[:user_id])
      redirect_to store_url
    elsif
      @user=User.new(params[:id])
    end
    
    
  end
end
