The [MapR Event Store for Apache Kafka](https://mapr.com/products/mapr-streams/) 
is a core component of the MapR Data Platform. It is a distributed framework for storing and accessing data streams on MapR using the standard Kafka API, and it is the only big data streaming system to support global event replication reliably at IoT scale.

## Creating Streams

Before you can publish messages to a *topic*, you need to create a *stream* to hold the topic. *Streams* are unique to the MapR Event Store for Apache Kafka. They help administrators apply security policies and other configurations to groups of related topics.

Create a stream `maprcli stream create -path /tmp/mystream -produceperm p -consumeperm p -topicperm p -ttl 900`{{execute}}
Create a topic `maprcli stream topic create -path /tmp/mystream -topic mytopic -partitions 1`{{execute}}
View the stream and topic `maprcli stream topic list -path /tmp/mystream`{{execute}}

## Standard APIs

It is a core principle of MapR that users should be able to interact with data using standard APIs. In previous steps you saw how file I/O can be achieved using POSIX and HDFS. Standard SQL was demonstrated for querying tables in the MapR Database. Kafka is the defacto standard API for streams and it too is supported by MapR. Lets look at a few examples which use the standard Kafka API to publish and consume messages to/from streams.

Note, while this tutorial focuses on command-line utilites, MapR supports many of the same APIs using programming languages such as Java, Scala, Python, C++, C#, and Go.

## Publish and Consume Stream Messages

For demonstration purposes, we'll stream network packets using `tcpdump`. Publish 100 network packages as messages to a stream.

`tcpdump -q -l -n -nn -c 100 | tee | /opt/mapr/kafka/kafka-*/bin/kafka-console-producer.sh --topic /tmp/mystream:mytopic --broker-list this.will.be.ignored:9092`{{execute}}

Now, consume those messages from the stream.

`/opt/mapr/kafka/kafka-*/bin/kafka-console-consumer.sh --topic /tmp/mystream:mytopic --from-beginning --bootstrap-server this.will.be.ignored:9092 --max-messages 100`{{execute}}

Also try piping the consumer to a utility for sorting stream records by source IP address:

`/opt/mapr/kafka/kafka-*/bin/kafka-console-consumer.sh --topic /tmp/mystream:mytopic --from-beginning --bootstrap-server this.will.be.ignored:9092 --max-messages 100 | sort -k3 | uniq -c -3 | sort -n`{{execute}}

That command counts the most active network connections which occurred during our tcpdump network capture.