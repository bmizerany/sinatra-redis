Sinatra Redis Extension
========================

Extends [Sinatra](http://www.sinatrarb.com/) with an extension method for
dealing with redis databases using the rubyredis.rb client library that
comes with the redis source (pre-packaged with this library for convenience).
You can Install the `sinatra-redis` with rip

    $ rip install git://github.com/bmizerany/sinatra-redis.git

or
    $ gem install sinatra-redis -s http://gemcutter.org
or

    $ gem install bmizerany-sinatra-redis -s http://gems.gemcutter.org

and use like:

    $ vim sinatra-using-redis.rb

    require 'sinatra'
    require 'sinatra/redis'

    # Establish the database connection; or, omit this and use the REDIS_URL
    # environment variable as the connection string; or, default to redis://locahost:6379/0
    #
    # NOTE: The database is the integer in the path
    # set :redis, 'redis://some-remote-server:1234/5' 

    # At this point, you can access the Redis object using the "redis" object:
    puts redis.delete "foos"
    puts redis.rpush "foos", "redis"
    puts redis.rpush "foos", "is"
    puts redis.rpush "foos", "sweet!"

    # access redis within the context of an HTTP request
    get '/foos' do
      @foos = redis.lrange("foos", 0, -1) # Array
      @foos.inspect
    end

    $ ruby sinatra-using-redis.rb

### Redis Reference Material

  * The [Redis Wiki](http://code.google.com/p/redis/)

  * The [Redis Command Reference](http://code.google.com/p/redis/wiki/CommandReference)

  * The [Redis Source](http://github.com/antirez/redis)

  * Ezra's Mountain West Ruby Conf '09 [Talk](http://mwrc2009.confreaks.com/13-mar-2009-19-24-redis-key-value-nirvana-ezra-zygmuntowicz.html)

### NOTE about the rip-off

  This Code and README.md is a heavy adaption of [rtomayko's sinatra-sequel](http://github.com/rtomayko/sinatra-sequel/)

# LICENSE

Copyright (c) 2009 Blake Mizerany

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
