Within each step, a series of Markdown extensions have been created that can provide various details for the users' experience.

For example, commands such as `echo "Run in Terminal"`{{execute}}
 can be executed by clicking the command.

This is done by adding `execute` to the markdown code block, for example:
<pre>`echo "Run in Terminal"`{{execute}}</pre>

More can be found at the scenario [on Markdown extensions](https://katacoda.com/scenario-examples/markdown-extensions).

# create streams
maprcli stream create -path /user/mapr/stream -produceperm p -consumeperm p -topicperm p
maprcli stream topic create -path /user/mapr/stream -topic flights  
maprcli table create -path /user/mapr/flighttable -tabletype json -defaultreadperm p -defaultwriteperm p

java -cp ./mapr-spark-flightdelay-1.0.jar:`mapr classpath` streams.MsgProducer
