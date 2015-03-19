namespace :db do
  desc "Clear the DB and fill with excellent sample data"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    # Clear out old data
    [Blog, Entry, Comment, User].each(&:destroy_all)

    # Add Blogs, Entries, & Comments
    Blog.populate 5 do |blog|
      blog.title = Faker::Lorem.words(3)
      blog.description = Faker::Lorem.sentences(5)
      Entry.populate 5..20 do |entry|
        entry.title = Faker::Lorem.words(3)
        entry.text = Faker::Lorem.paragraphs(10)
        entry.image = Faker::Avatar.image
        entry.video = Faker::Avatar.image
        Comment.populate 3..10 do |comment|
          comment.text = Faker::Lorem.sentences(5)
        end
      end
    end

    # Add User Data
    User.populate 25 do |user|
      user.email = Faker::Internet.email
      user.encrypted_password = Faker::Number.number(10)
      user.sign_in_count = 1..30
      user.name = Faker::Name.name
    end

    puts "All done!"
  end
end