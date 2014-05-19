require 'koala'
app_id='295591993933923'
app_secret='5668023efcfd829b8e6a6d20c6e0f1d7'
@graph=Koala::Facebook::OAuth.new(app_id,app_secret)
profile = @graph.get_object("me")
friends = @graph.get_connections("me", "friends")
puts "posted successfully"