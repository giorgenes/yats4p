require 'spec_helper'

describe Task do
  describe "#late?" do
    context 'when the task is not completed' do
      before do
        @task = FactoryGirl.build(:task, :due => '2012-1-1')
      end
      it "should return true when the deadline is older than today" do
        Date.stub(:today).and_return(Date.strptime('2013-1-1'))
        @task.late?.should == true
      end
      it "should return false when the deadline is newer than today" do
        Date.stub(:today).and_return(Date.strptime('2011-1-1'))
        @task.late?.should == false
      end
    end
    context 'when the task is completed' do
      before do
        @task = FactoryGirl.build(:completed_task, :due => '2012-1-1')
      end

      it 'should return false' do
        Date.stub(:today).and_return(Date.strptime('2011-1-1'))
        @task.late?.should == false
      end
    end
  end

end
