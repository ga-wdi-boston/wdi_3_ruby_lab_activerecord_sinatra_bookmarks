# require 'faker'
# require_relative 'main'

# Link.delete_all
# Comment.delete_all

# 10.times do |i|
#   link = Link.create(:url => Faker::Internet.url, :short_url => Faker::Lorem.word)

#     i.times do |comment_count|
#     link.comments << Comment.new(:author => Faker::Name.name, :body => Faker::Lorem.paragraphs(comment_count).join("\n"))
#   end

# end
