class Post < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  has_many :reviews
  has_many_attached :photos
end
