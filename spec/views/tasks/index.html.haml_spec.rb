require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :title => "Title",
        :completed => false
      ),
      stub_model(Task,
        :title => "Title",
        :completed => false
      )
    ])
  end

  it "renders a list of tasks" do
    render
  end
end
