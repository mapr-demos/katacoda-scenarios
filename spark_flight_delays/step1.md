This is tutorial demonstrates how to use Spark in Apache Zeppelin for a machine learning exercise. To run this exercise, follow the Zeppelin notebook described below.

***Wait about 5 minutes for Zeppelin to download and install.***

1. `ps -e -f | grep zeppelin`{{execute}}
2. Open Zeppelin in the toolbar tab
3. Open and run the Flight Delays Prediction notebook. ✈️


The possibility to blend machine learning with real-time data flowing through a single platform is opening a world of new possibilities, such as enabling organizations to take advantage of opportunities as they arise. Leveraging these opportunities requires requires processing events in real time, applying machine learning to add value, and scalable fast storage. 

In this Hands on Lab we will look at the architecture of a data pipeline  that combines streaming data with machine learning and fast storage
to predict flight delays. You will see the end-to-end process required to build this application using Apache APIs for Kafka, Spark and other technologies:

![scenario](/mapr/scenarios/spark_flight_delaysassets/flightusecase.png)

<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/flightusecase.png?raw=true" width=33%>


Step 1 Using Apache Spark SQL to explore the flight dataset.
using Apache Spark Machine Learning to build a model to predict flight delays.

Step 2 Using Spark Machine Learning to build a model to predict flight delays.

Step 3 MapR Event Store for Kafka, Spark Streaming, Spark SQL, and MapR Database: Using the ML model to enrich streaming flight events with flight delays predictions, to store in MapR Database, 
and do real time analysis with Spark SQL.

Part 4 Optional Analysis of Flight delay data and predictions stored in MapR Database with Apache Spark SQL, Apache Drill.

Part 5 Optional Analyzing Flight Delays with Apache Spark GraphFrames and MapR Database