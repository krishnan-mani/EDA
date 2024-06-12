require 'aws-sdk-sqs'
client = Aws::SQS::Client.new(region: "eu-central-1")

queue_url = ENV["QUEUE_URL"]
raise "Queue URL not supplied (via environment variable $QUEUE_URL)" if queue_url.nil?

desc "consume one message successfully"

task :consume_one do

    receive_message_result = client.receive_message({
      queue_url: queue_url, 
      message_attribute_names: ["All"], # Receive all custom attributes.
      max_number_of_messages: 1, # Receive at most one message.
      wait_time_seconds: 0 # Do not wait to check for the message.
    })
      
    # Display information about the message.
    # Display the message's body and each custom attribute value.
    receive_message_result.messages.each do |message|
      puts message.body 
      
      # Delete the message from the queue.
      client.delete_message({
        queue_url: queue_url,
        receipt_handle: message.receipt_handle    
      })
    end

end
