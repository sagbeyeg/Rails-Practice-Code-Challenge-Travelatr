class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :post
end
