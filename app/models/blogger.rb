class Blogger < ApplicationRecord
    has_many :posts
    has_many :destination, through: :post
    validates :age, presence: true, inclusion: { in: 0..100 }
    # length: {minimum: 1}
    validates :bio, presence: true, length: {minimum: 30}
    validates :name, uniqueness: true
end
