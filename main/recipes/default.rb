["git", "build-essential", "ruby-ee", "passenger", 'mysql::server'].each do |r|
  include_recipe r
end