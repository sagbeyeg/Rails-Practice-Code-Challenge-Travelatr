class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_liked_post
        self.posts.max {|p| p.likes}
    end
end
