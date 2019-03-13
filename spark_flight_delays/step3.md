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


# create streams
maprcli stream create -path /user/mapr/stream -produceperm p -consumeperm p -topicperm p
maprcli stream topic create -path /user/mapr/stream -topic flights  
maprcli table create -path /user/mapr/flighttable -tabletype json -defaultreadperm p -defaultwriteperm p

java -cp ./mapr-spark-flightdelay-1.0.jar:`mapr classpath` streams.MsgProducer



The [MapR Database](https://mapr.com/products/mapr-db/) is a scalable, high performance, NoSQL database designed for data-intensive applications. 

CRUD operations can be performed programmatically using Python, Java, and Node.js, or with command-line utilities, as demonstrated below.

## Create a table

Import a JSON file into that table. This command may take a minute to complete. `mapr importJSON -idField business_id -src /tmp/yelp_academic_dataset_business.json -dst /apps/business -mapreduce false`{{execute}}


## Using Apache Spark’s ML pipelines with a Random Forest Classifier to predict flight delays


1. To run this exercise, click on the black Zeppelin tab on the right, scroll to the top, click on the blue Zeppelin icon. 
2. This should take you to a Zeppelin page with a list of notebooks.
3. Open and the FlightDelay2SparkMachineLearning notebook. ✈️
4. Follow the Notebook lab instructions. Click on the READY > to run the Spark code paragraphs. 

## CRUD Operations on the Shell

The ***mapr dbshell*** enables you to create and manipulate JSON tables in MapR-DB.

Open the MapR Database Shell utility. `mapr dbshell`{{execute}} 

Set the pretty print option. `jsonoptions --pretty true --withtags false`{{execute}}

Read the first two rows in the table. `find /apps/business --limit 2`{{execute}}

To learn more about the various commands, run help' or help <command> , for example `help insert`{{execute}}.

Retrieve one document using its id. `find /apps/business --id cJWbbvGmyhFiBpG_5hf5LA --f _id,name,city`{{execute}}

Insert a new record. `insert /apps/business --value '{"_id":"hofbraus000222333", "name":"Hofbräuhaus", "city":"München"}'`{{execute}}

Query document with Condition. `find /apps/business --where '{ "$like" : {"name":"Hofbräu%"} }' --f _id,name,city`{{execute}}

Exit the shell. `exit`{{execute}}

### Run SQL with Apache Drill

Apache Drill is a distributed SQL engine integrated into the MapR Data Platform. Try it!

Open the Apache Drill shell:
`sqlline -u jdbc:drill:zk=localhost:5181 -n mapr -p mapr`{{execute}}

Connect to the Drill service: 
<pre><code class="execute">select _id, name, city from dfs.`/apps/business` where name like '%Hofbräu%';</code></pre>

Exit the shell: `!quit`{{execute}}

