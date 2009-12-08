Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name = 'sinatra-redis'
  s.version = '0.1.1'
  s.date = '2009-09-21'

  s.description = "Extends Sinatra with redis helpers for instant redis use"
  s.summary = s.description

  s.authors = ["Blake Mizerany"]
  s.email = "blake.mizerany@gmail.com"

  # = MANIFEST =
  s.files = %w[
    README.md
    lib/sinatra/redis.rb
    lib/sinatra/redis/rubyredis.rb
    sinatra-redis.gemspec
  ]
  # = MANIFEST =

  s.extra_rdoc_files = %w[README.md]
  s.add_dependency 'sinatra',    '>= 0.9.4'

  s.has_rdoc = true
  s.homepage = "http://github.com/rtomayko/sinatra-redis"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Sinatra::Redis"]
  s.require_paths = %w[lib]
  s.rubyforge_project = 'bmizerany'
  s.rubygems_version = '1.1.1'
end
