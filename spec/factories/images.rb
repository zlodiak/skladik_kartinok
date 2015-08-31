FactoryGirl.define do
  factory :image do
    association :user
    association :album
    is_delete nil
    image_file_name 'f2.jpg'
    image_content_type 'image/jpeg'
    image_updated_at '2015-08-09 21:20:19 +0300'
    description '31 августа 1948 года родился Рудольф Шенкер — немецкий рок-музыкант, гитарист, композитор и основатель группы Scorpions.'
    created_at '2015-08-09 18:20:19.563981'
    updated_at '2015-08-09 18:20:19.563981'
    image_file_size 15887
  end
end