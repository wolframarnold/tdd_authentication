Factory.define(:note) do |f|
  f.title "Reminder"
  f.body "Take Joe for lunch"
  f.uid '12345678'
  f.provider 'twitter'
end
