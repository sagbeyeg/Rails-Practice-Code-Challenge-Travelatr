class Blogger < ApplicationRecord
    has_many :posts
    has_many :destination, through: :posts
    validates :age, presence: true, inclusion: { in: 0..100 }
    # length: {minimum: 1}
    validates :bio, presence: true, length: {minimum: 30}
    validates :name, uniqueness: true

  def total_blog_likes
    self.posts.inject(0){|sum,p| sum + p.likes }
  end

  def most_liked_post
    self.posts.max {|p| p.likes }
  end

  # def top_5_des
  #   self.destinations.find
  # end
end
