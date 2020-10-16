require 'csv'

Artist.delete_all
Genre.delete_all
Song.delete_all

filename = Rails.root.join('db/top10s.csv')
csv_data = File.read(filename)
songs = CSV.parse(csv_data, headers: true)
