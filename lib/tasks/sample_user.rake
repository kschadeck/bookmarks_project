require 'rubygems'
require 'faker'

namespace :db do
    desc "Fill database with sample data"
    task :populate => :environment do
        Rake::Task['db:reset'].invoke
        admin = User.create!(:username => "kaboodle",
            :name => "Kit Kaboodle",
            :email => "kitkaboodle@aol.com",
            :password => "kaboodle",
            :password_confirmation => "kaboodle")
        admin.toggle!(:admin)    

        99.times do |n|
            username = Faker::Name.name
            name = Faker::Name.name
            email = "example-#{n+1}@aol.com"
            password = "password"
            User.create!(:username => username,
                         :name => name,
                         :email => email,
                         :password => password,
                         :password_confirmation => password)
        end
        #User.all(:limit => 6).each do |user|
        #    50.times do
        #        dName = Faker::Internet.domain_name
        #        dSuffix = Faker::Internet.domain_suffix
        #        dWord = Faker::Internet.domain_word
        #        url = "http://"+ dName +"_" + dWord + "." + dSuffix
        #        name = Faker::Name.name
        #        user.bookmarks.create!(:url => url, :name => name)
        #    end
        #end
    end
end
