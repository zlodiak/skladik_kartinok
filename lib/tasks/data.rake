# to start to use the rake data:populate_status_polls
# to start to use the rake data:populate_images
# attention! in model image.rb validation for field image must be disabled

namespace :data do
  desc "create status_polls"
  task :populate_status_polls => :environment  do   
    StatusPoll.create!(id: 0, title: 'Открыто')
    StatusPoll.create!(id: 1, title: 'Закрыто')
  end 

  desc "create statuses"
  task :populate_statuses => :environment  do   
    Status.create!(id: 0, title: 'Пользователь')
    Status.create!(id: 1, title: 'Менеджер')
    Status.create!(id: 2, title: 'Администратор')
  end  

  desc "create users"
  task :populate_users => :populate_statuses  do   
    # admin
      User.create!(   
        name: 'admin',
        email: "ad@ad.ad",
        info: 'Я работаю психотерапевтом, частным образом в своей клинике в Хайфе в районе Бат-Галим и в амбулаторном психиатрическом отделении в одной из крупнейших Израильских больниц - Рамбаме. Так-же я супервизор (мадриха) студентов факультета социальной работы Хайфского университета.',
        status_id: 2,
        password: 'qwerty',
        password_confirmation: 'qwerty'
      )    

    # managers
    3.times do |n|
      User.create!(   
        name: Faker::Name.name,
        email: "ma#{n+1}@ad.ad",
        info: Faker::Lorem.paragraph(7),
        status_id: 1,
        password: 'qwerty',
        password_confirmation: 'qwerty'
      )
    end    

    # users
    43.times do |n|
      User.create!(   
        name: Faker::Name.name,
        email: "us#{n+1}@ad.ad",
        info: Faker::Lorem.paragraph(7),
        status_id: 0,
        password: 'qwerty',
        password_confirmation: 'qwerty'
      )
    end
  end    

  desc "create albums"
  task :populate_albums => :populate_users  do   
    users = User.all

    users.each do |user|
      album_quantity = rand(7..10)
      album_quantity.times do |n|
        Album.create!(   
          title: Faker::Name.title + '_' + user.id.to_s + '_' + n.to_s,
          user_id: user.id,
          closed: nil,
          description: Faker::Lorem.paragraph(7)
        )
      end  
    end
  end 

  desc "create polls"
  task :populate_polls => :populate_albums do   
    users = User.all.where(status_id: [1, 2])

    users.each do |user|
      polls_quantity = rand(18..21)
      polls_quantity.times do |n|
        Poll.create!(   
          title: Faker::Name.title + '_' + user.id.to_s + '_' + n.to_s,
          user_id: user.id,
          status_poll_id: rand(0..1),
          description: Faker::Lorem.paragraph(7)
        )
      end  
    end
  end   

  desc "create images"
  task :populate_images => :populate_polls do   
    albums = Album.all

    albums.each do |album|
      user_id = album.user_id
      image_quantity = rand(7..10)
      image_quantity.times do |n|
        # random generate id poll associated with this image
        in_polls = rand(1..10)
        if in_polls == 7
          id_poll = rand(1..60)
        else
          id_poll = nil
        end

        # if id_poll not nil then image associated with poll
        Image.create!(   
          user_id: user_id,
          poll_id: id_poll,
          album_id: album.id,
          image_file_name: '/images/no_image.jpeg',
          description: Faker::Lorem.paragraph(3)
        )
      end  
    end
  end 

      
end


