class List < ActiveRecord::Base
  attr_accessible :name, :tasks_attributes
  belongs_to :user
  has_many :tasks
  accepts_nested_attributes_for :tasks
  def count_tasks_not_completed
  self.tasks.where(:completed => false).count
  end
  
end
