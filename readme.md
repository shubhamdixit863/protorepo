Problem Statement: gRPC Unidirectional Streaming with Exponential Backoff and Kafka Integration

Objective

Build a gRPC-based data streaming system in Golang where:
	•	The gRPC client establishes a unidirectional streaming connection with a gRPC server.
	•	The client implements automatic retries using an exponential backoff strategy in case of connection failures.
	•	The server sends real-time data streams to the client.
	•	The client processes the received stream and publishes the data to an Apache Kafka topic for further consumption.

⸻

Requirements
	1.	gRPC Server
	•	Implements a unidirectional streaming RPC method.
	•	Sends a continuous stream of mock event data.
	•	Handles connection drops gracefully and logs any errors.
	2.	gRPC Client
	•	Initiates a streaming request to the gRPC server.
	•	Uses an exponential backoff strategy for retrying failed connections.
	•	Receives and processes the streamed data.
	•	Publishes the received stream to an Apache Kafka topic.
	3.	Apache Kafka Integration
	•	The client should publish received stream messages to a Kafka topic.
	•	The topic name should be configurable.
	•	Kafka should handle high-throughput 