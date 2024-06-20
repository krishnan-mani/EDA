### Pre-requisites

- [rbenv](https://github.com/rbenv/rbenv)
- [rbenv-gemset](https://github.com/jf/rbenv-gemset)

### SQS

```shell

$ rbenv local
$ rbenv gemset active
$ bundle install

$ export AWS_PROFILE=workshop
$ export AWS_REGION=eu-central-1

$ aws sqs list-queues --output text --query "QueueUrls[0]"
# export an environment variable: QUEUE_URL
$ echo $QUEUE_URL

# send a message
$ aws sqs send-message --queue-url $QUEUE_URL --message-body "foo"

# receive a message
$ aws sqs receive-message --queue-url $QUEUE_URL
$ aws sqs receive-message \
    --max-number-of-messages 10 \
    --queue-url $QUEUE_URL \
    --query "Messages[*].Body"

# run integration tests
$ rspec -f d -t integration

# purge queue
$ aws sqs purge-queue --queue-url $QUEUE_URL

$ rake -T
rake consume_one                   # consume one message successfully
rake publish_many_messages[count]  # publish several messages (upto 10)

$ rake publish_many_messages[3]
$ rake consume_one

```
