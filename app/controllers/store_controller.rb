class StoreController < ApplicationController
  skip_before_filter :authorize
  
 def index
@products = Product.all
@cart = current_cart
end
def main
@user = User.new
render :partial => "users/form",
:locals => { :user => @user }
 
end

end
