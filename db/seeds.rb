require 'csv'

Song.delete_all
Artist.delete_all
Genre.delete_all

puts "Total: #{Artist.count} artists"
puts "Total: #{Genre.count} genres"
puts "Total: #{Song.count} songs"

filename = Rails.root.join('db/top10s.csv')
csv_data = File.read(filename)
songs = CSV.parse(csv_data, headers: true)

songs.each do |m|
  artist = Artist.find_or_create_by(name: m['artist'])
  genre = Genre.find_or_create_by(name: m['top genre'])

  if artist && artist.valid? && genre && genre.valid?
    genreId = Genre.find_by name: m['top genre']
    song = artist.songs.create(
      title: m['title'],
      year: m['year'],
      bpm: m['bpm'],
      energy: m['nrgy'],
      danceability: m['dnce'],
      loudness: m['dB'],
      liveness: m['live'],
      valence: m['val'],
      duration: m['dur'],
      acousticness: m['acous'],
      speechness: m['spch'],
      popularity: m['pop'],
      genre_id: genreId.id
    )
    puts "Invalid Song #{m['title']}" unless song.valid?
  else
    puts "Invalid Artist or Genre #{m['artist']}, #{m['top genre']}"
  end
end

puts "Created #{Artist.count} artists"
puts "Created #{Genre.count} genres"
puts "Created #{Song.count} songs"

