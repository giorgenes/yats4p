module TasksHelper
  def done_undone_button(task)
    link_to (task.completed ? "Not done!" : "Done!"),
      task_path(task, {:task => {:completed => !task.completed}}),
      :method => :put,
      :remote => true,
      :class => "btn btn-mini pull-right btn-#{task.completed ? 'action' : 'success'}" 
  end
end
