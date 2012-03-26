Factory.define :user do |user|
  user.username              "bookmarkuser"
  user.name                  "mark book"
  user.email                 "bookmark@example.com"
  user.password              "foobars"
  user.password_confirmation "foobars"
end