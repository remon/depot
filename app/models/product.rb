class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title
  
  has_many :comments ,:dependent=>:destroy 
   has_attached_file :photo, :styles => { :medium => "150x150>", :thumb => "100x100>" }
 
 validates :title, :description, :presence => true
validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
validates :title, :uniqueness => true
#validates :image_url, :format =>{:with => %r{\.(gif|jpg|png)$}i,:message => 'must be a URL for GIF, JPG or PNG image.'}
default_scope :order => 'title'
has_many :line_items ,:dependent=>:destroy
has_many :orders ,:through=>:line_items 
before_destroy :ensure_not_referenced_by_any_line_item
private
def ensure_not_referenced_by_any_line_item
  if line_items.empty?
    return true
  else
    errors.add(:base,'line items present')
    return false
  end 
end


end
