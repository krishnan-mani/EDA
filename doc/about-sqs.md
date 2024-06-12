### Goals

We want to
- publish messages that look a certain way
- consume different kinds of messages reliably
- handle any "persistent" failures

### SQS message protocol for clients

- A message "producer" publishes a message to the queue. The message stays on the queue until it is deleted, or its age exceeds the retention period (from 1 minute to 14 days, default 4 days)
- Any consumer that requests a message may receive some message on the queue. For a further short period of time (visibility timeout), the same message will not be received by any other consumer.
  - (note on whether order is guaranteed)
- The consumer may or may not successfully process the message
  - If the consumer processes the message successfully, they delete the message. It is no longer available
  - If the consumer fails to process the message, or the visibility timeout elapses, the same message may be received by a different consumer
- Message delivery: at-least once vs. exactly-once
- Message ordering: not guaranteed (by default)

### Characteristics

- Publishing and consuming messages are stateless operations
- Publishers and consumers are never (directly) aware of each other

### Failure to process messages

- A particular message may not be processed successfully despite several attempts by any number of consumers
- One can choose to configure a "dead-letter queue" with the (primary) queue. When a message exceeds the `MaxReceiveCount` for the queue, SQS moves the message to the dead-letter queue

### Elasticity

- An indefinitely large number of messages may be published to a queue within a short time 
- As the number of messages on a queue grows (i.e., messages are not being processed fast enough at the moment), users can scale up the number of message consumers as desired.
- There is no scaling action required on the part of the service, the rate at which one may publish and consume messages is only limited by API throttling.

### Security, reliability, availability

- All messages are encrypted at rest. All communication with the service is encrypted in transit. Encryption is transparent to clients.
- All publishers and consumers are authenicated, and must have the necessary privileges (using IAM)
- Reliability: will not lose messages
- Availability: highly available

### Cost

- practically free!
- One does not pay for storage of messages, only for operations to publish and consume messages
- The first one million requests are free every month
- A million requests costs 40 cents (upto the 100 billion count)
- also: cost for the usage of KMS to encrypt and decrypt messages.
- also: data transfer costs are incurred only in the event of egress from AWS

