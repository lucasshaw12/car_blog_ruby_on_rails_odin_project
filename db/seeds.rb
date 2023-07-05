# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the bin/rails
# db:seed command (or created alongside the database with db:setup).

# To drop, create and seed a new local database
# RUN in terminal rake db:drop db:create db:migrate db:seed
# Create 10 users
# 10.times do |user|
#   User.create!(id: "#{user}", email: "user_email#{user}@email.com", password: 'password', created_at: Time.now, updated_at: Time.now, username: "#{user}_username", confirmed_at: Time.now)

#   # Create 10 articles
#   10.times do |article|
#     Article.create!(title: "Article #{article}", body: "Body
#       - #{article} - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris
#       quis mauris turpis. Curabitur nec cursus lectus. In purus elit, bibendum in
#       odio in, interdum porta neque. Nullam ultricies metus id lobortis interdum.
#       Mauris volutpat nisl ac felis interdum ornare. Aenean interdum sollicitudin
#       risus, et condimentum dolor molestie non. Integer lorem nisi, convallis non
#       pulvinar quis, mollis suscipit sem. Phasellus luctus lacus id lobortis
#       efficitur. Nam hendrerit tempus ante vel rhoncus. Phasellus vulputate odio non
#       risus sodales interdum. Etiam vel bibendum erat. Proin sit amet velit eget leo
#       vestibulum accumsan eu eget ligula. Vestibulum cursus ex tortor, eu semper leo
#       maximus et. Sed turpis neque, sagittis vel mattis nec, tincidunt sit amet
#       purus. Cras eget ullamcorper sem, sed ullamcorper mi. Donec in feugiat dolor.
#       Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac
#       turpis egestas. Quisque non pharetra nulla. Nam libero lacus, interdum ac
#       viverra ac, tempus ac lorem. In venenatis quis nulla quis pretium. Nam
#       placerat, arcu a euismod dignissim, nisi orci bibendum neque, eget venenatis
#       nisl sapien vel mi. Quisque quis nisl vitae mi faucibus dapibus eget ac ipsum.
#       Aliquam vehicula dolor blandit volutpat efficitur. Nulla eu nunc purus.
#       Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque iaculis
#       venenatis tellus id pharetra. Phasellus at aliquam erat, id finibus est.",
#       status: 'public', created_at: Time.now, updated_at: Time.now, user_id: user)
#   end
#   10.times do |comment|
#     comment = 1
#     Comment.create!(body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris
#       quis mauris turpis. Curabitur nec cursus lectus. In purus elit, bibendum in
#       odio in, interdum porta neque. Nullam ultricies metus id lobortis interdum.
#       Mauris volutpat nisl ac felis interdum ornare. Aenean interdum sollicitudin
#       risus, et condimentum dolor molestie non.", article_id: comment, user_id: user, created_at: Time.now, updated_at: Time.now)
#   end
# end

def create_users(number)
  number.times.map do |i|
    User.create!(id: "#{i}", email: "user_email#{i}@email.com", password: 'password', created_at: Time.now,
                 updated_at: Time.now, username: "#{i}_username", confirmed_at: Time.now)
  end
end

def create_articles_for_users(users, number)
  users.map do |user|
    number.times.map do |i|
      user.articles.create!(title: "Article #{i}", body: "Body
      - #{i} - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris
      quis mauris turpis. Curabitur nec cursus lectus. In purus elit, bibendum in
      odio in, interdum porta neque. Nullam ultricies metus id lobortis interdum.
      Mauris volutpat nisl ac felis interdum ornare. Aenean interdum sollicitudin
      risus, et condimentum dolor molestie non. Integer lorem nisi, convallis non
      pulvinar quis, mollis suscipit sem. Phasellus luctus lacus id lobortis
      efficitur. Nam hendrerit tempus ante vel rhoncus. Phasellus vulputate odio non
      risus sodales interdum. Etiam vel bibendum erat. Proin sit amet velit eget leo
      vestibulum accumsan eu eget ligula. Vestibulum cursus ex tortor, eu semper leo
      maximus et. Sed turpis neque, sagittis vel mattis nec, tincidunt sit amet
      purus. Cras eget ullamcorper sem, sed ullamcorper mi. Donec in feugiat dolor.
      Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac
      turpis egestas. Quisque non pharetra nulla. Nam libero lacus, interdum ac
      viverra ac, tempus ac lorem. In venenatis quis nulla quis pretium. Nam
      placerat, arcu a euismod dignissim, nisi orci bibendum neque, eget venenatis
      nisl sapien vel mi. Quisque quis nisl vitae mi faucibus dapibus eget ac ipsum.
      Aliquam vehicula dolor blandit volutpat efficitur. Nulla eu nunc purus.
      Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque iaculis
      venenatis tellus id pharetra. Phasellus at aliquam erat, id finibus est.",
                            status: 'public', created_at: Time.now, updated_at: Time.now, user_id: i)
    end
  end
end

def create_comments_for_articles(articles, users, number)
  articles.map do |article|
    comment_users = users.reject { |user| user == article.user }
    number.times.map do |i|
      article.comments.create!(user: comment_users.sample, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris
      quis mauris turpis. Curabitur nec cursus lectus. In purus elit, bibendum in
      odio in, interdum porta neque. Nullam ultricies metus id lobortis interdum.
      Mauris volutpat nisl ac felis interdum ornare. Aenean interdum sollicitudin
      risus, et condimentum dolor molestie non.", article_id: i, created_at: Time.now, updated_at: Time.now)
    end
  end
end

def setup
  new_users = create_users(10)
  new_articles = create_articles_for_users(new_users, 5).flatten
  create_comments_for_articles(new_articles, new_users, 10)
end

setup
