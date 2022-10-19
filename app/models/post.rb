# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  address     :string
#  description :text
#  latitude    :float
#  longitude   :float
#  post_type   :boolean
#  status      :string
#  reward      :boolean
#  user_id     :bigint           not null
#  animal_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :text
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  has_many :reviews, dependent: :destroy
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
