The [MapR Database](https://mapr.com/products/mapr-db/) is a scalable, high performance, NoSQL database designed for data-intensive applications. 

CRUD operations can be performed programmatically using Python, Java, and Node.js, or with command-line utilities, as demonstrated below.

## Create a table

Import a JSON file into a MapR Database table. This command may take a minute to complete. `mapr importJSON -idField id -src /mapr/demo.mapr.com/user/mapr/data/flightdata2018.json -dst /user/mapr/flighttable -mapreduce false`{{execute}}

## CRUD Operations on the Shell

The ***mapr dbshell*** enables you to create and manipulate JSON tables in MapR-DB.

Open the MapR Database Shell utility. `mapr dbshell`{{execute}} 

Set the pretty print option. `jsonoptions --pretty true --withtags false`{{execute}}

Read the first 5 rows in the table. `find /user/mapr/flighttable --limit 5`{{execute}}

To learn more about the various commands, run help' or help <command> , for example `help insert`{{execute}}.

Query with condition to find flights originating from Atlanta `find /user/mapr/flighttable --where '{ "$eq" : {"src":"ATL"} }' --f id,src,dst,prediction`{{execute}}

Query with condition to find flights originating from Atlanta that were late. `find /user/mapr/flighttable --where '{"$and":[{"$eq":{"label":1.0}},{ "$like" : {"id":"ATL%"} }]}' --f id,prediction`{{execute}}

Exit the shell. `exit`{{execute}}

### Run SQL with Apache Drill

Apache Drill is a distributed SQL engine integrated into the MapR Data Platform. Try it!

Open the Apache Drill shell:
`sqlline -u jdbc:drill:zk=localhost:5181 -n mapr -p mapr`{{execute}}

Connect to the Drill service, Query to find flights with id starting with ATL (originating from Atlanta)  
<pre><code class="execute">select id, src, dst, depdelay from dfs.`/user/mapr/flighttable` where id like 'ATL%' order by depdelay desc limit 20;</code></pre>

<pre><code>select crsdephour, count(depdelay) as countdelay from dfs.`/user/mapr/flighttable` where depdelay > 40 group by crsdephour order by crsdephour;</code></pre>

<pre><code>select src, count(depdelay) as countdelay from dfs.`/user/mapr/flighttable` where depdelay > 40 and src='ATL' group by src;</code></pre>

Exit the shell: `!quit`{{execute}}

