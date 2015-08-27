## FH Chatty

Yet another chat app. build with rails + firehose. This is served for demonstration purpose only.

## Getting Started

You'll need redis, http://redis.io/

Clone this repo, cd into it, then run the following

```
bundle install
rake db:create db:migrate
firehose server # start firehose
redis-server # start redis server
rails s # start the rails server
```
