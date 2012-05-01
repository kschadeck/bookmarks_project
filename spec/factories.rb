Factory.define :user do |user|
  user.username              "Kathleen Kaboodle"
  user.name                  "kaboodle"
  user.email                 "kathleen@example.com"
  user.password              "kaboodles"
  user.password_confirmation "kaboodles"
end
Factory.sequence :email do |n|
  "person-#{n}@example.com"
end
Factory.sequence :username do |n|
  "person#{n}"
end

Factory.define :bookmark do |bookmark|
  bookmark.url "http://matcmadison.edu"
  bookmark.name "Madison College"
  bookmark.association :user
end