namespace :permalink_records_updation do

  desc "update posts records for permalink"
  task update_permalink: :environment do
    Post.all.find_each do |post|
      post.permalink_updation
      post.save
    end

  end

end
