The MapR Data Platform converges Hadoop, Spark, and Apache Drill with a distributed file system, distributed database, and distributed event streaming on a single cluster. This *convergence* improves performance and lowers hardware costs for big data applications because it means the same cluster used for data storage can also be used for analytics!

Run Hadoop: `hadoop jar /opt/mapr/hadoop/hadoop-*/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar pi 1 1`{{execute}}

Run Spark: `/opt/mapr/spark/spark-*/bin/run-example --master yarn SparkPi 1`{{execute}}

Distributed storage and analytical workloads have traditionally required separate clusters but with MapR they operate on a single all-purpose cluster, thereby reducing cluster sprawl, improving performance, simplifying administration, and lowering hardware costs.
