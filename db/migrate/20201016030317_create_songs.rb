class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :year
      t.integer :bpm
      t.integer :energy
      t.integer :danceability
      t.integer :loudness
      t.integer :liveness
      t.integer :valence
      t.integer :duration
      t.integer :acousticness
      t.integer :speechness
      t.integer :popularity
      t.references :artist, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
