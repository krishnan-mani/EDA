require 'aws-sdk-sqs'
require 'date'
require 'json'

class Publisher

  def initialize(client, queue_url)
    @client, @url = client, queue_url
  end

  def send_message(msg)
    @client.send_message({
      queue_url: @url,
      message_body: msg
    })
  end

  def send_many_messages(count = 3)
    timestamp = DateTime.now()
    messages = 1.upto(count).map do |index|
      {id: index, at: timestamp.to_s}
    end
    messages.each do |msg| 
      send_message(msg.to_json)
    end
  end

end