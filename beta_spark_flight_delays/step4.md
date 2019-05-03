
<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/flightusecase.png?raw=true width=400 height=400">
<br/>

### Apache Drill SQL with MapR Database


Apache Drill is an open source, low-latency query engine for big data that delivers interactive SQL analytics at petabyte scale. Drill provides a massively parallel processing execution engine, built to perform distributed query processing across the various nodes in a cluster.

<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/querying-data-with-apache-drill.png?raw=true width=500 height=500 ">

With Drill, you can use SQL to interactively query and join data from files in JSON, Parquet, or CSV format, Hive, and NoSQL stores, including MapR Database, HBase, and Mongo, without defining schemas.

Try Apache Drill with the Drill shell and Execute queries:

`sqlline -u jdbc:drill:zk=localhost:5181 -n mapr -p mapr`{{execute}}


<pre><code class="execute">select id, src, dst, depdelay from dfs.`/user/mapr/flighttable` where id like 'ATL%' order by depdelay desc limit 20;</code></pre>

Exit the shell: `!quit`{{execute}}

Try Apache Drill with the Drill web UI:

1. Click on the Drill tab on the right.
2. This should take you to a Drill web UI. Login with userid mapr password mapr
3. Click on the Query tab in the Drill web UI.  
4. Login using userid mapr password mapr.
5. Copy paste, or type one of the queries below next to the 1 and click submit.

Example queries:

<pre><code>select id, src, dst, depdelay, prediction from dfs.`/user/mapr/flighttable` where id like 'ATL%' limit 20;</code></pre>

<pre><code>select crsdephour, count(depdelay) as countdelay from dfs.`/user/mapr/flighttable` where depdelay > 40 group by crsdephour order by crsdephour;</code></pre>

<pre><code>select src, count(depdelay) as countdelay from dfs.`/user/mapr/flighttable` where depdelay > 40 and src='ATL' group by src;</code></pre>

Explore the Drill Web UI 

1. Click on the top Profiles tab
2. Click on one of the highlighted queries
3. Click on Physical Plan Visual Plan Edit Query to explore the query plan

### Apache Spark SQL with MapR Database
there is also a Spark SQL notebook but this is similar to the queries you already ran in the Streaming notebook. 
1. To run this exercise, click on the black Zeppelin tab on the right, scroll to the top, click on the blue Zeppelin icon. 
2. This should take you to a Zeppelin page with a list of notebooks.
3. Open and the FlightDelay4SQLMapRDatabase notebook. ✈️
4. Follow the Notebook lab instructions. Click on the READY > to run the Spark code paragraphs. 

## Summary
All of the components of the use case architecture we just discussed can run on the same cluster with the MapR Data Platform.  This is the official end of this workshop. If you have time remaining you can continue to the next step to look at Spark GraphFrames.
