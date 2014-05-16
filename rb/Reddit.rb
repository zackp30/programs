require 'redditkit'
require 'logger'
reddit = RedditKit::Client.new 'ApertronBot', 'python349'
puts 'Logged in' if reddit.signed_in?
posts = reddit.links category: :new, time: :all
posts.each {|p| puts p.domain}
