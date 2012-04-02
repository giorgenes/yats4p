class Task < ActiveRecord::Base
  attr_accessible :completed, :due, :title

  def late?
    return false if completed
    return false if due.nil?
    due < Date.today
  end
end
