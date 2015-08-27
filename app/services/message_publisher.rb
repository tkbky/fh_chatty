require 'firehose'
require 'json'

class MessagePublisher
  def initialize(channel, message)
    @channel = channel
    @message = message
  end

  def call
    firehose = Firehose::Client::Producer::Http.new("//localhost:7474")
    firehose.publish(@message.to_json).to("/#{@channel.name}")
  end
end
