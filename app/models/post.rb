class Post < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  has_many :reviews
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model

  pg_search_scope :search_by_description_and_address_and_title,
  against: [ :description, :address, :title],
  using: {
   tsearch: { prefix: true }
  }
end
