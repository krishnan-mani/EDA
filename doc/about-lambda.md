### compute with functions

- Each function implements a compute task
- Function invocations are event driven, and can act on the event payload
- Functions obtain information about their operating environment from the `context`
- success factors:
  - prefer stateless implementation
  - prefer idempotent operation

### integration with SQS

- synchronous invocation by messages on an SQS queue
- the Lambda service handles deletion of messages when the function invocation completes without error
- the service can process a batch of messages together