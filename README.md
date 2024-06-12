
```shell

$ rbenv local
$ rbenv gemset active

$ export AWS_PROFILE=workshop
$ export AWS_REGION=eu-central-1
$ aws sqs list-queues
# export an environment variable: QUEUE_URL

# send a message
$ aws sqs send-message --queue-url $QUEUE_URL --message-body "foo"

# receive a message
$ aws sqs receive-message --queue-url $QUEUE_URL

# run integration tests
$ rspec -f d -t integration

# purge queue
$ aws sqs purge-queue --queue-url $QUEUE_URL

```

