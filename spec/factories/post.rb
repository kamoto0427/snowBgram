FactoryBot.define do

  factory :post do
    user_id               {"1"}
    title                 {"SWANSのサングラス"}
    appeal                {"最新モデルです"}
    image                 {File.open("#{Rails.root}/public/images/test_image.jpg")}
    category_id           {"3"}
  end

end