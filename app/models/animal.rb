# == Schema Information
#
# Table name: animals
#
#  id         :bigint           not null, primary key
#  specie     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Animal < ApplicationRecord
  has_many :posts
  include PgSearch::Model
  multisearchable against: [:specie]
  # enum specie: {
  #   'perro' => 1, 'gato' => 0
  #  }
end
