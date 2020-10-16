require 'csv'



filename = Rails.root.join('db/top10s.csv')
csv_data = File.read(filename)
products = CSV.parse(csv_data, headers: true)