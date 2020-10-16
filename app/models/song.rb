class Song < ApplicationRecord
  belongs_to :artists
  belongs_to :genres
  validates :title, :artist, :genre, presence: true
  validates :year, :bpm, :energy, :danceability, :loudness, :liveness, :valence, :duration, :acousticness, :speechiness, :popularity, numericality: { only_integer: true }
end
