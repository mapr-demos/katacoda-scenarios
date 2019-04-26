The possibility to blend machine learning with real-time data flowing through a single platform is opening a world of new possibilities, such as enabling organizations to take advantage of opportunities as they arise. Leveraging these opportunities requires processing events in real time, applying machine learning to add value, and scalable fast storage.

In this Hands on Lab we will look at the architecture of a data pipeline  that combines streaming data with machine learning and fast storage
to predict flight delays. You will see the end-to-end process required to build this application and you will become familiar with the MapR Data Platform by interacting with Apache Spark SQL, Spark Streaming, Spark Machine learning, MapR Event Store for Kafka, and MapR Database on a single-node MapR cluster.
<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/flightusecase.png?raw=true" width=50% height=40% >
<br/>

This Lab consists of the following steps:

1. Using Apache Spark SQL to explore the flight dataset.

2. Using Spark Machine Learning to build a model to predict flight delays.

3. Use Spark Structured Streaming with the Kafka API to read streaming flight events, use a Spark ML model to enrich streaming flight events with flight delays predictions, store the results in MapR Database, and do real time analysis with Spark SQL.

4. Optional Analysis of Flight delay data and predictions stored in MapR Database with Apache Spark SQL, Apache Drill.

5. Optional Analyzing Flight Delays with Apache Spark GraphFrames and MapR Database

The MapR Data Platform includes a wide variety of analytics and open source tools such as Apache Hadoop, Apache Spark, and Apache Drill with real-time database capabilities, global event streaming, and scalable enterprise storage to power a new generation of Big Data applications. With support for POSIX, cutting-edge AI and ML tools can run natively on the same cluster as other analytics and leverage the power of the MapR Data Platform.

The MapR Data Platform delivers dataware for AI and analytics, effectively handling the diversity of data types, data access, and ecosystem tools needed to manage data as an enterprise resource regardless of the underlying infrastructure or location. With the MapR Data Platform, users can store, manage, process, and analyze all data - including files, tables, and streams from operational, historical, and real-time data sources - with mission-critical reliability to meet production SLAs.  MapR solves the challenges of complex data environments by managing data and its ecosystem across multiple clouds and containerized infrastructures.

<img src="https://github.com/mapr-demos/katacoda-scenarios/blob/master/mapr-intro/assets/Data-Platform-Chart.png?raw=true" width=40% height=40% >

