# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
cameron = User.create! email: 'cra2126@columbia.edu', password: 'password', password_confirmation: 'password'
aobo = User.create! email: 'aobo.guo@yale.edu', password: 'password', password_confirmation: 'password'

Photo.destroy_all
horse = Photo.create! caption: 'Look at my horse', image: 'http://cache.desktopnexus.com/thumbseg/1127/1127787-bigthumbnail.jpg', user_id: aobo.id, public: true
dragon = Photo.create! caption: 'This animal is stunning', image: 'http://p1.pichost.me/i/63/1874779.jpg', user_id: cameron.id, public: false

Comment.destroy_all
mean_comment = Comment.create! body: 'this horse is ugly', photo_id: horse.id, user_id: cameron.id