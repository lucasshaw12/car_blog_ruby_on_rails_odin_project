# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the bin/rails
# db:seed command (or created alongside the database with db:setup).

# user = User.new(email: "lucaspython@hotmail.com", username: "lucasusername", password: "password", password_confirmation: "password")
# user.skip_confirmation!
# user.save

10.times do |article| Article.create!(title: "Article #{article}", body: "Body 
- #{article} - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris
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
status: "public", user_id: User.first.id) end