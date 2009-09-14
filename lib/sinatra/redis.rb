require 'uri'
require 'sinatra/redis/rubyredis'

module Sinatra
  module RedisHelper
    def redis
      options.redis
    end
  end

  module RedisExtension
    def redis=(url)
      @redis = nil
      set :redis_url, url
      redis
    end

    def redis
      url = URI(redis_url)
      @redis ||=
        RedisClient.new(
          :host => url.host,
          :port => url.port,
          :database => url.path[1..-1]
        )
    end

  protected

    def self.registered(app)
      app.set :redis_url, lambda { 
        ENV['REDIS_URL'] || "redis://127.0.0.1:6379/0" 
      }
      app.helpers RedisHelper
    end
  end

  register RedisExtension
end
