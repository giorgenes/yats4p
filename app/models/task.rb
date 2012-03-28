class Task < ActiveRecord::Base
  attr_accessible :completed, :due, :title
end
