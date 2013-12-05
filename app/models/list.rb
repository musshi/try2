class List < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :tasks
  accepts_nested_attributes_for :tasks
  
end
