class Genre < ApplicationRecord
  has_many :songs
  validates :name, uniqueness: true, presence: true
end
