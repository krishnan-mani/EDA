require 'aws-sdk-sqs'

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
    
  end

end
