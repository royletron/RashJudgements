require 'faker'

namespace :db do
  desc "Fill database with sample data" 
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Darren Royle",
                 :username => "royletron",
                 :email => "darren.royle@oup.com",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org" 
      password = "password"
      User.create!(:name => name,
                   :username => Faker::Internet.user_name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    User.all(:limit => 6).each do |user|
      10.times do
        lat = (-(rand(468293) + 1039581))
        lat = lat.to_f / 1000000.to_f
        long = (rand(160212) + 51684051)
        long = long.to_f / 1000000.to_f
        user.establishments.create!(:name => Faker::Address.city, :long => long.to_f, :lat => lat.to_f)
      end 
    end 
  end
end