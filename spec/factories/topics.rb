# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    topic "MyString"
    is_private false
    user nil
  end
end
