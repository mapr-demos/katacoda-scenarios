### Run SQL with Apache Drill

Apache Drill is a distributed SQL engine integrated into the MapR Data Platform. Try it!

Open the Apache Drill shell:
`sqlline -u jdbc:drill:zk=localhost:5181 -n mapr -p mapr`{{execute}}

Connect to the Drill service: 
<pre><code class="execute">select id, src, dst, depdelay, prediction from dfs.`/user/mapr/flighttable` where id like 'ATL%';</code></pre>

Exit the shell: `!quit`{{execute}}


<img src="https://github.com/mapr-demos/katacoda-scenarios/raw/master/spark_flight_delays/assets/flightusecase.png?raw=true width=400 height=400">
<br/>

1. To run this exercise, click on the black Zeppelin tab on the right, scroll to the top, click on the blue Zeppelin icon. 
2. This should take you to a Zeppelin page with a list of notebooks.
3. Open and the FlightDelay4SQLMapRDatabase notebook. ✈️
4. Follow the Notebook lab instructions. Click on the READY > to run the Spark code paragraphs. 

All of the components of the use case architecture we just discussed can run on the same cluster with the MapR Data Platform. 
This is the official end of this workshop. If you have time remaining you can continue to the next step to look at Spark GraphFrames.
