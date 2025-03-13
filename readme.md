# gRPC Client-Server with Exponential Backoff and Kafka Integration

## Problem Statement

You are provided with a `.proto` file and the corresponding generated protobuf files. Using these, you need to create two services:

1. **gRPC Server**
    - Implements a unary RPC service.
    - Contains a **goroutine that modifies a global shared payload**.
    - The shared object, `System`, contains a field `PartnerStorage { Id }`.
    - The goroutine updates the `Id` field **after 20 seconds**.
    - The server responds immediately with the current state of the shared object.

2. **gRPC Client**
    - Calls the gRPC server’s API.
    - Implements **exponential backoff with retries** to handle potential failures when making the gRPC call.
    - The client should continue retrying until it successfully receives the `System` object with the updated `Id`.
    - Once the client successfully receives data from the gRPC server, it **publishes an event to Kafka**.

### Bonus Requirement
- Integrate **Kafka** using [segmentio/kafka-go](https://github.com/segmentio/kafka-go) to publish an event when the client successfully receives data from the gRPC call.

## Struct Definitions
```go
type System struct {
    PartnerStorage PartnerStorage
}

type PartnerStorage struct {
    Id string
}
```

## Implementation Guidelines
1. **Define the `.proto` file**
    - Ensure it includes a unary RPC definition.

2. **Generate gRPC code**
    - Use the `.proto` file to generate client and server stubs.

3. **Implement the gRPC Server**
    - Implement a **goroutine to modify the shared payload (`System`)** and update `PartnerStorage.Id` after 20 seconds.
    - The server immediately returns the current state of the shared object when requested.

4. **Implement the gRPC Client**
    - Use **exponential backoff with retries** for handling failures.
    - Keep retrying until the response contains the updated `Id` field.

5. **Integrate Kafka Producer**
    - Once the client successfully gets the response from the gRPC server, publish an event to Kafka.

## Expected Outcome
- The client successfully retries using exponential backoff until it gets a valid response from the server.
- The server's goroutine updates the `Id` field after 20 seconds.
- The server responds immediately with the current state of the shared object.
- Upon receiving the response with the updated `Id`, the client sends an event to Kafka.

## You only need to write the code to publish the message
