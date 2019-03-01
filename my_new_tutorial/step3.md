The [MapR Database](https://mapr.com/products/mapr-db/) is a scalable, high performance, NoSQL database designed for data-intensive applications. 

CRUD operations can be performed programmatically using Python, Java, and Node.js, or with command-line utilities, as demonstrated below.

## Create a table

Import a JSON file into that table. This command may take a minute to complete. `mapr importJSON -idField business_id -src /tmp/yelp_academic_dataset_business.json -dst /apps/business -mapreduce false`{{execute}}

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

