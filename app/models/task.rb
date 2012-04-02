class Task < ActiveRecord::Base
  validates_presence_of :title
  attr_accessible :completed, :due, :title

  def late?
    return false if completed
    return false if due.nil?
    due < Date.today
  end
end
