require 'spec_helper'

shared_examples_for 'task list' do
  context 'when clicking the new button' do
    it 'should open a form' do
      visit(tasks_path)
      click_on("New")
      page.should have_css("#task_ form")
    end
  end

  context 'when creating a new task' do
    it 'should display the new item inline' do
      visit(tasks_path)
      click_on("New")
      page.should have_css("#task_ form")
      fill_in "task_title", :with => 'test'
      expect {
        click_on("Save")
        page.should_not have_css("#task_ form")
      }.to change(Task, :count).by(1)
    end
  end
end

describe 'task list management', :js => true, :driver => :webkit do
  context 'with a list of tasks' do
    before do
      @tasks = []
      @tasks << FactoryGirl.create(:completed_task)
      @tasks << FactoryGirl.create(:task)
      @tasks << FactoryGirl.create(:late_task)
    end
    
    it 'should have a list of tasks' do
      visit(tasks_path)
      @tasks.each do |task|
        page.should have_css("#task_#{task.id}")
      end
    end

    it_should_behave_like 'task list'
  end

  context 'with no tasks' do
    it_should_behave_like 'task list'
  end
end
