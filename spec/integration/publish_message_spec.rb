require_relative '../../lib/publisher'
require 'aws-sdk-sqs'

describe "publisher" do

  it "publishes message", :integration do
    client = Aws::SQS::Client.new(region: "eu-central-1")
    queue_url = ENV["QUEUE_URL"]
    raise "No queue URL specified for integration test" if queue_url.nil?

    publisher = Publisher.new(client, queue_url)
    publisher.send_message("test")
  end

end
