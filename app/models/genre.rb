class Genre < ApplicationRecord
  has_many :songs
  validates :name, :song_count, presence: true
  validates :name, uniqueness: true
  validates :song_count, numericality: { only_integer: true }
end
