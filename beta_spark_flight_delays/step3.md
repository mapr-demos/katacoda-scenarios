In Step 3 of this HOL we will use Spark Structured Streaming with the Kafka API to read streaming flight events, use a Spark ML model to enrich streaming flight events with flight delays predictions, store the results in MapR Database, and do real time analysis with Spark SQL.
Before you can run the notebook for this step, you must create a MapR Event Store Topic and MapR Database Table. Also you must have the ML model stored on MapR XD from the previous step.
<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/flightusecase.png?raw=true width=400 height=400">
<br/>

## Creating a MapR Event Store Topic

The [MapR Event Store for Apache Kafka](https://mapr.com/products/mapr-streams/) 
is a distributed publish-subscribe event streaming system that enables producers and consumers to exchange events in real time in a parallel and fault-tolerant manner via the Apache Kafka API.
Topics are a logical stream of events. Topics organize events into categories and decouple producers from consumers. Topics are partitioned for throughput and scalability. MapR Event Store can scale to very high throughput levels, easily delivering millions of messages per second using very modest hardware.

<img src="https://mapr.com/blog/real-time-analysis-popular-uber-locations-spark-structured-streaming-machine-learning-kafka-and-mapr-db/assets/image16.png" width=400 height=400 >

## Creating Streams

Before you can publish messages to a *topic*, you need to create a *stream* to hold the topic. *Streams* are unique to the MapR Event Store for Apache Kafka. They help administrators apply security policies and other configurations to groups of related topics.

Create a stream `maprcli stream create -path /user/mapr/stream -produceperm p -consumeperm p -topicperm p`{{execute}}

Create a topic `maprcli stream topic create -path /user/mapr/stream -topic flights -partitions 1`{{execute}}

View the stream and topic `maprcli stream topic list -path /user/mapr/stream`{{execute}}

## Use Kafka Java API to pubish flight events to the Topic

Kafka is the defacto standard API for streams and it too is supported by MapR. For simple tutorial purposes, we'll use a prebuilt Java client to read from the flights JSON file and publish as messages to the MapR Event store /user/mapr/stream:flights Topic. 

<pre><code class="execute">java -cp ./mapr-spark-flightdelay-1.0.jar:`mapr classpath` streams.MsgProducer</code></pre>

Now, get info on the topic

`maprcli stream topic info -path /user/mapr/stream -topic flights`{{execute}}

Now, consume 10 messages from the topic

`/opt/mapr/kafka/kafka-*/bin/kafka-console-consumer.sh --topic /user/mapr/stream:flights --from-beginning --bootstrap-server this.will.be.ignored:9092 --max-messages 10`{{execute}}

## Create a MapR Database table for Storing Enriched Events

The [MapR Database](https://mapr.com/products/mapr-db/) is a scalable, high performance, NoSQL database designed for data-intensive applications. Use the MapR cli to create the table which Spark Structured Streaming will write to:

`maprcli table create -path /user/mapr/flighttable -tabletype json -defaultreadperm p -defaultwriteperm p`{{execute}}

## Using Apache Spark Structured Streaming Notebook 
<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/StreamDBApplication.png?raw=true width=400 height=400">

1. To run this exercise, click on the black Zeppelin tab on the right, scroll to the top, click on the blue Zeppelin icon. 
2. This should take you to a Zeppelin page with a list of notebooks.
3. Open and the FlightDelay3StructuredStreaming notebook. ✈️
4. Follow the Notebook lab instructions. Click on the READY > to run the Spark code paragraphs. 

## Using the MapR Database Shell

The ***mapr dbshell*** enables you to create, manipulate, and query JSON tables in MapR-DB.

After you have started the spark streaming write, you can use the mapr dbshell to query the Data. 

Open the MapR Database Shell utility. `mapr dbshell`{{execute}} 

Set the pretty print option. `jsonoptions --pretty true --withtags false`{{execute}}

Read the first 5 rows in the table. `find /user/mapr/flighttable --limit 5`{{execute}}

To learn more about the various commands, run help' or help <command> , for example `help find`{{execute}}.

Query document with condition to find flights originating from Atlanta `find /user/mapr/flighttable --where '{ "$eq" : {"src":"ATL"} }' --f id,src,dst,prediction`{{execute}}

Query document with condition to find flights originating from Atlanta that were late. `find /user/mapr/flighttable --where '{"$and":[{"$eq":{"label":1.0}},{ "$like" : {"id":"ATL%"} }]}' --f id,prediction`{{execute}}

Exit the shell. `exit`{{execute}}

## Summary
In this Lab, you learned how to use the following:
A Spark machine learning model in a Spark Structured Streaming application
Spark Structured Streaming with MapR Event Store to ingest messages using the Kafka API
Spark Structured Streaming to persist to MapR Database for continuously rapidly available SQL analysis

Click continue before running another notebook.




