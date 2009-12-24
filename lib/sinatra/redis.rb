require 'uri'
require 'redis'

module Sinatra
  module RedisHelper
    def redis
      options.redis
    end
  end

  module Redis
    def redis=(url)
      @redis = nil
      set :redis_url, url
      redis
    end

    def redis
      url = URI(redis_url)
      @redis ||= (
        base_options = {
          :host => url.host,
          :port => url.port,
          :db => url.path[1..-1],
          :password => url.password
        }

        ::Redis.new(
          base_options.merge(
            options.redis_options
          )
        )
      )
    end

  protected

    def self.registered(app)
      app.set :redis_url, ENV['REDIS_URL'] || "redis://127.0.0.1:6379/0"
      app.set :redis_options, {}
      app.helpers RedisHelper
    end
  end

  register Redis
end
