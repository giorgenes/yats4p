# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title "MyString"
    completed false
    due "2012-03-29"
  end

  factory :completed_task, :parent => :task do
    completed true
  end
end
