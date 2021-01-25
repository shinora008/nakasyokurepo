FactoryBot.define do
  factory :comment do
    title "MyString"
    comment "MyText"
    user_id 1
    shop_id 1
    report_id 1
    user nil
    shop nil
    report nil
  end
end
