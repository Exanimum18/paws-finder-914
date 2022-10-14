class Animal < ApplicationRecord
  has_many :posts
  enum specie: {
    'perro' => 1, 'gato' => 0
   }
end
