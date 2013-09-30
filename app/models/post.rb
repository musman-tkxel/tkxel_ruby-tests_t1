require 'uri'

class Post < ActiveRecord::Base

  #update_permalink_records

  # Defining URL
  #URL of my localhost server
  MYURL = "localhost:3000/"

  before_save :permalink_updation



  private
  def permalink_updation
    if MYURL =~ URI::regexp

      tTitle = MYURL + self.title

      while (n = count_occur? tTitle) != 0
        tTitle = tTitle + "-" + n.to_s
      end

     self.permalink = tTitle
    end
  end

  #count the occurrence of
  def count_occur?(mylink)
    count = 0
    Post.find_each do |post|
      if post.permalink == mylink
        count = count + 1
      end
    end
    count
  end

end