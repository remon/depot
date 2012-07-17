class Comment < ActiveRecord::Base
  
   extend FriendlyId
  friendly_id :body
  
  belongs_to :product
end
