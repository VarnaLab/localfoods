source 'http://rubygems.org'

gem 'rails', '3.0.1'
gem 'paperclip', '2.7.0'

group :development, :test do
  gem 'sqlite3','1.3.3'
  gem 'rspec-rails', '2.0.1'
  gem 'factory_girl_rails', '1.0'
  
  #leaving out annotate gem, it could not be found in sources
  #gem 'annotate-models'
end

group :production, :staging do
  gem 'pg'
end

group :test do
  gem 'rspec', '2.0.1'
  gem 'webrat', '0.7.1'
end

