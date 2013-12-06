class Task < ActiveRecord::Base
  default_scope order("position ASC")
  belongs_to :list
  attr_accessible :completed, :name, :position
  
end
