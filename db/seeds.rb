usernames = ["alice", "bob", "carol"]

usernames.each do |username|
  user = User.create
  user.username = username
  user.email = "#{username}@example.com"
  user.password = "12341234"
  user.save
end

l = League.new
l.name = "The League"
l.user_id = 2
l.save

p = Publication.new
p.title ="Welcome to the League"
p.body = "Hope you enjoy everyone. And just a reminder that you all get no ass!"
p.league_id = 1
p.user_id = 1
p.save

p = Publication.new
p.title ="Test"
p.body = "Testing to see if this works."
p.league_id = 1
p.user_id = 3
p.save

smack = Smack.new
smack.title ="Test"
smack.body = "Testing to see if this works."
smack.league_id = 1
smack.user_id = 1
smack.save

smack = Smack.new
smack.title ="Test"
smack.body = "Testing to see if this works."
smack.league_id = 1
smack.user_id = 2
smack.save

smack = Smack.new
smack.title ="Test"
smack.body = "Testing to see if this works."
smack.league_id = 1
smack.user_id = 3
smack.save

like = Like.new
like.smack_id = 1
like.user_id = 3
like.save

like = Like.new
like.smack_id = 1
like.user_id = 2
like.save

like = Like.new
like.smack_id = 1
like.user_id = 2
like.save

like = Like.new
like.smack_id = 2
like.user_id = 1
like.save

like = Like.new
like.smack_id = 3
like.user_id = 1
like.save

like = Like.new
like.smack_id = 3
like.user_id = 2
like.save

dislike = Dislike.new
dislike.smack_id = 2
dislike.user_id = 3
dislike.save

dislike = Dislike.new
dislike.smack_id = 2
dislike.user_id = 3
dislike.save

dislike = Dislike.new
dislike.smack_id = 1
dislike.user_id = 1
dislike.save

dislike = Dislike.new
dislike.smack_id = 2
dislike.user_id = 1
dislike.save

dislike = Dislike.new
dislike.smack_id = 3
dislike.user_id = 2
dislike.save

dislike = Dislike.new
dislike.smack_id = 3
dislike.user_id = 2
dislike.save
