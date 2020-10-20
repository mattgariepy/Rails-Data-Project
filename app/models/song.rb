class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :genre
  validates :title, :year, presence: true
  validates :year, :bpm, :energy, :danceability, :loudness, :liveness, :valence, :duration, :acousticness, :speechness, :popularity, numericality: { only_integer: true }
end
