#!/usr/bin/ruby
require "date"

file_count = 0
Dir.glob(Dir.pwd + '/*.md') do |rb_file|
  file_count = file_count + 1
end

new_file_count = ARGV[0].to_i
i = 1

while i <= new_file_count
	day_of_year = file_count + i
	date_string = Date.strptime("2015-#{day_of_year}", "%Y-%j").to_s
	out_file = File.new("b#{day_of_year}.md", "w")
	out_file.puts "---\n"
	out_file.puts "title:  \"#{day_of_year}/365\"\n"
	out_file.puts "date:   #{date_string}\n"
	out_file.puts "thumbnail-path: \"thumbnails/thumbnail-#{day_of_year}.jpg\""
	out_file.puts "full-path: \"full-size/full-size-#{day_of_year}.jpg\""
	out_file.puts "short-description: \"Description\""
	out_file.puts "---"
	out_file.close
	i = i+1
end

# ---
# title:  "001/365"
# date:   2015-01-01
# thumbnail-path: "thumbnails/thumbnail-1.jpg"
# full-path: "full-size/full-size-1.jpg"
# short-description: "Photo taken while waiting to board a plane at SFO."
# ---
