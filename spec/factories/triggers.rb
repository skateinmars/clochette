FactoryGirl.define do
  factory :trigger do
    project

    event_type 'foo_bar'

    action_name 'no_op'
  end
end
