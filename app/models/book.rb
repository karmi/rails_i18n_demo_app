class Book < ActiveRecord::Base
  
  validates_presence_of     :author, :title
  validates_numericality_of :items
  
end
