FactoryGirl.define do
  factory :admin_item, class: 'Admin::Item' do
    name "MyString"
    cost 1
    description "MyText"
  end
end
