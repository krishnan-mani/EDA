### using CLI

- create a queue
- send message
- receive message

### using ruby code

- consume message successfully
- fail to consume message
- repeated failures result in moving the message to DLQ
- publish a number of messages

### in the console

- look at monitoring for the queue

### using code

- write a "hello #{user}" lambda function handler
- (using console) deploy and run the same
- write a lambda function handler to consume messages
- (using console) deploy and hook up to SQS queue
- publish a number of messages and observe invocations