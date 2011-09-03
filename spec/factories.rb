Factory.define(:note) do |f|
  f.title "Reminder"
  f.body "Take Joe for lunch"
  f.association :user, :factory => :twitter_user
end

Factory.define(:twitter_user, :class => User) do |f|
  f.uid '12345678'
  f.provider 'twitter'
  f.avatar 'http://example.com/joesmith.png'
  f.name 'Joe Smith'
  f.nickname 'joesmith'
end
