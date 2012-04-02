module TasksHelper
  def done_undone_button(task)
    link_to (task.completed ? "Not done!" : "Done!"),
      task_path(task, {:task => {:completed => !task.completed}}),
      :method => :put,
      :class => "btn btn-mini btn-#{task.completed ? 'action' : 'success'}" 
  end
end
