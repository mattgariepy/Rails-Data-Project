class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.integer :year
      t.integer :bpm
      t.integer :energy
      t.integer :danceability
      t.integer :loudness
      t.integer :liveness
      t.integer :valence
      t.integer :duration
      t.integer :acousticness
      t.integer :speechiness
      t.integer :popularity

      t.timestamps
    end
  end
end
