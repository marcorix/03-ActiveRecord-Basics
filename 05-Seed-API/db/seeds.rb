require "json"
require "rest-client"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
posts_ids = JSON.parse(response)

posts_ids.take(10).each do |post|
  res = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{post}.json"
  post = JSON.parse(res)
  new_post = Post.new(title: post["title"], url: post["url"], votes: post["score"])
  new_post.save
end
