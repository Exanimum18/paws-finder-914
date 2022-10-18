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
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
