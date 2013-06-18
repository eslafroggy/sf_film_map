# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   require 'httparty'
   
   
   movies = HTTParty.get('https://data.sfgov.org/api/views/yitu-d5am/rows.json?accessType=DOWNLOAD')
   
   
   movies["data"].each do |movie|
     Location.create(:address => movie[10] , :fun_fact => movie[11] ).movies << Movie.find_or_create_by_movie_title(:movie_title => movie[8], :release_year => movie[9], :director => movie[14])
   end