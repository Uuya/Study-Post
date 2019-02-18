FactoryBot.define do
  factory :post do
      title           {'テストタイトル'}
      studied_at      {Faker::Number.number(8)}
      study_time      {Faker::Number.between(0, 12)}
      study_minutes   {Faker::Number.between(0, 59)}
      content         {'テスト内容'}
      study_method    {'テスト勉強方法'}
      created_at      {Faker::Time.between(2.days.ago, Time.now, :all)}
      updated_at      {Faker::Time.between(2.days.ago, Time.now, :all)}
      user
  end
end
